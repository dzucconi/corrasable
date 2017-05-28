class WordsController < ApplicationController
  def index
    syllables = params[:syllables].present? ? params[:syllables].to_i : 1..99

    @words = Word
      .where(syllables: syllables)
      .order_by({}.tap { |hsh| hsh[order_by] = direction })
      .page(params[:page])
      .per(per(25))

    render json: @words, serializer: WordsSerializer
  end

  def bulk
    sanitizer = Sanitizer.new(params.require(:text))

    @words ||= sanitizer.output.map do |tokens|
      tokens.map do |token|
        Word.lookup token
      end
    end.flatten

    render json: @words, serializer: WordsSerializer
  end

  def suggestions
    query = [
      { '$match': { word: { '$not': /\'/ } } },
      { '$sample': { size: per(10) } },
      { '$project': { word: 1 } }
    ]

    if params[:syllables].present?
      query.unshift('$match': { syllables: params[:syllables].to_i })
    end

    @words = Word.collection.aggregate(query).to_a.pluck(:word)

    render json: @words
  end

  def show
    @word = Word.lookup(params[:id])
    render json: @word
  end

  def search
    query = params.require(:q)
    algorithm = params[:algorithm] || Phonetic::Index::DEFAULT_ALGORITHM
    limit = params[:limit].to_i || 10

    @words = Word.search(query, algorithm, limit)

    render json: @words
  end

  def letter
    letter = params.require(:letter).chars.first
    @words = Word.where(word: /^#{letter}/i).pluck(:word)

    render json: @words.sort
  end

  private

  def order_by
    (params[:order_by] || :word).to_sym
  end

  def direction
    (params[:direction] || :asc).to_sym
  end

  def per(amount = 25)
    params[:per].present? ? params[:per].to_i : amount
  end
end
