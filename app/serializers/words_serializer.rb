class WordsSerializer < ActiveModel::Serializer
  has_many :words

  attributes :size

  def words
    object
  end

  def size
    object.size
  end
end
