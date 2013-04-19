class ConversionController < ApplicationController
  def phonemes
    converter = Converter::Phoneme.new(params[:text])
    @phonemes = converter.phonemes

    render json: @phonemes
  end

  def nato
    converter = Converter::Nato.new(params[:text])
    @nato = converter.nato

    render json: @nato
  end
end
