class WordsController < ApplicationController
  def show
    @word = Word.find_by(word: params[:id].upcase)
    render "words/show"
  end
end
