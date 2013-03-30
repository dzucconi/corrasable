class ConversionController < ApplicationController
  def phonemes
    converter = Converter::Phoneme.new(params[:text])
    @phonemes = converter.phonemes

    render json: @phonemes
  end
end
