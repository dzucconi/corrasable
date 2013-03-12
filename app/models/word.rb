class Word
  include Mongoid::Document

  field :word
  field :phonemes, type: Array
  field :syllables, type: Integer
  field :language, type: Symbol

  index({ word: 1 }, { name: "word_index" })

  def self.lookup(word)
    find_by(word: word.upcase)
  end

  def self.syllables(word)
    lookup(word).syllables
  rescue Mongoid::Errors::DocumentNotFound
    # Fallback to guessing if the word is not in the dictionary
    # 
    Lingua::EN::Syllable.syllables(word)
  end

  def self.phonemes(word)
    lookup(word).phonemes.join(" ")
  rescue Mongoid::Errors::DocumentNotFound
    "N/A"
  end
end
