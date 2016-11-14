class WordsController < ApplicationController
  def show
    @word = Word.lookup(params[:id])
    render json: @word
  end

  def search
    @words = Word.search(params.require(:q), params[:algorithm] || Phonetic::Index::DEFAULT_ALGORITHM)
    render json: @words
  end
end
