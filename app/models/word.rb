class Word
  include Mongoid::Document

  MISSING = 'N/A'.freeze

  field :word
  validates_uniqueness_of :word

  field :phonemes, type: Array, default: [MISSING]
  field :syllables, type: Integer
  field :language, type: Symbol

  index(syllables: 1)
  index(syllables: -1)
  index({ word: 1 }, { unique: true })
  index({ word: -1 }, { unique: true })

  Phonetic::Index::ALGORITHMS.each do |algorithm|
    field algorithm
    index({}.tap { |hsh| hsh[algorithm] = 1 })
  end

  after_initialize do
    unless self.persisted?
      Phonetic::Index::ALGORITHMS.each do |algorithm|
        self[algorithm] = self.send(algorithm).presence || Phonetic::Index.send(algorithm, word)
      end
    end
  end

  class << self
    def search(word, algorithm = Phonetic::Index::DEFAULT_ALGORITHM, limit = 10)
      criteria = {}.tap { |hsh| hsh[algorithm] = lookup(word).send(algorithm.to_sym) }
      Word.where(criteria).limit(limit)
    end

    def lookup(word)
      find_by(word: word.upcase.gsub(/\s/, ''))
    rescue Mongoid::Errors::DocumentNotFound
      new(word: word.upcase).tap do |instance|
        # Experimental: stream of letters pronounced
        instance.phonemes = word.split('').map { |letter| lookup(letter).phonemes }.flatten
        # Mismatches between phonemes above and syllables, which can be guessed relatively accurately
        instance.syllables = Lingua::EN::Syllable.syllables(word)
      end
    end

    def syllables(word)
      lookup(word).syllables
    rescue Mongoid::Errors::DocumentNotFound
      # Fallback to guessing if the word is not in the dictionary
      Lingua::EN::Syllable.syllables(word)
    end

    def phonemes(word)
      lookup(word).phonemes.join(' ')
    rescue Mongoid::Errors::DocumentNotFound
      MISSING
    end
  end
end
