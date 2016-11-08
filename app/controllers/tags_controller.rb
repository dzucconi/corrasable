class TagsController < ApplicationController
  def index
    @tagger = Tagger.new(params[:text])
    render json: @tagger.send(params[:part])
  end

  def tagged
    @tagger = Tagger.new(params[:text])
    render text: @tagger.tagged
  end

  def parts
    render json: Tagger::PARTS
  end
end
