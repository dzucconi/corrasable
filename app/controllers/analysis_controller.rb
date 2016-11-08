class AnalysisController < ApplicationController
  def report
    @report = Analyzer::Report.new(params[:text])
    render json: @report, serializer: ReportSerializer
  end

  def syllables
    @syllables = Analyzer::Syllable.new(params[:text]).syllables
    render json: @syllables
  end
end
