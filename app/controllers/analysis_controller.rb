class AnalysisController < ApplicationController
  def report
    @report = Lingua::EN::Readability.new(params[:text])
    render "analysis/report"
  end

  def syllables
    @syllables = Analyzer::Syllable.new(params[:text]).syllables
    render json: @syllables
  end
end
