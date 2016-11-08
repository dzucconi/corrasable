class WordSerializer < ActiveModel::Serializer
  attributes :word, :phonemes, :syllables, :language
end
