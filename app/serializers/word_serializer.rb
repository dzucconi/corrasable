class WordSerializer < ActiveModel::Serializer
  attributes :word, :phonemes, :syllables, :language, :phonetic

  def phonetic
    Phonetic::Index.default(object.word)
  end
end
