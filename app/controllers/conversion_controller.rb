class ConversionController < ApplicationController
  def phonemes
    @report   = Lingua::EN::Readability.new(params[:text])
    @phonemes = @report.words.collect { |word| Word.phonemes(word) }.join(" | ")

    render json: { text: @phonemes }
  end
end
