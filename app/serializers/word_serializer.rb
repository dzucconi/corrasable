class WordSerializer < ActiveModel::Serializer
  attributes :word, :phonemes, :syllables
  attributes(*Phonetic::Index::ALGORITHMS)
end
