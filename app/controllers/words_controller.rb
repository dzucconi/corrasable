class WordsController < ApplicationController
  def index
    @words = Word
      .where(syllables: syllables)
      .order_by({}.tap { |hsh| hsh[order_by] = direction })
      .page(params[:page])
      .per(per(25))

    render json: @words, serializer: WordsSerializer
  end

  def suggestions
    criteria = { syllables: syllables }

    records = Word.collection.aggregate(
      [
        { '$match': criteria },
        { '$sample': { size: per(3) } },
        { '$project': { word: 1 } }
      ]
    ).to_a

    @words = Parallel.map(records) { |x| x['word'] }

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

  private

  def syllables
    params[:syllables].present? ? params[:syllables].to_i : 1..99
  end

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
