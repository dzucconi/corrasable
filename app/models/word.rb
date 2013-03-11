class Word
  include Mongoid::Document

  field :word
  field :phonemes, type: Array
  field :syllables, type: Integer
  field :language, type: Symbol

  index({ word: 1 }, { name: "word_index" })
end
