class ConversionController < ApplicationController
  def phonemes
    @phonemes = Converter::Phoneme.new(params[:text]).phonemes
    render json: @phonemes
  end

  def nato
    @nato = Converter::Nato.new(params[:text]).nato
    render json: @nato
  end
end
