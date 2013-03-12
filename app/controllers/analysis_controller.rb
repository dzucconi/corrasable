class AnalysisController < ApplicationController
  def report
    @report = Lingua::EN::Readability.new(params[:text])

    render "analysis/report"
  end

  def syllables
    @report    = Lingua::EN::Readability.new(params[:text])
    @syllables = @report.words.collect do |word|
      [word, Word.syllables(word)]
    end

    render json: @syllables
  end
end
