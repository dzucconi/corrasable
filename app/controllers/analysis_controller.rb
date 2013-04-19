class AnalysisController < ApplicationController
  def report
    @report = Lingua::EN::Readability.new(params[:text])

    render "analysis/report"
  end

  def syllables
    analyzer   = Analyzer::Syllable.new(params[:text])
    @syllables = analyzer.syllables

    render json: @syllables
  end
end
