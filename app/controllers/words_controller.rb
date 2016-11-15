class WordsController < ApplicationController
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
end
