class WordsController < ApplicationController
  def show
    @word = Word.lookup(params[:id])
    render json: @word
  end
end
