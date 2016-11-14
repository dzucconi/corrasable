class WordSerializer < ActiveModel::Serializer
  attributes :word, :phonemes, :syllables, :language
  attributes *Phonetic::Index::ALGORITHMS
end
