class Word
  include Mongoid::Document

  MISSING = 'N/A'.freeze

  field :word
  field :phonemes, type: Array, default: [MISSING]
  field :syllables, type: Integer
  field :language, type: Symbol

  index({ word: 1 }, name: 'word_index')

  class << self
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
