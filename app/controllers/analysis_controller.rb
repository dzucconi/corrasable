class AnalysisController < ApplicationController
  before_filter :get_report

  def debug
    render
  end

  def report
    render "analysis/report"
  end

  def sentences
    render json: {
      length: @report.num_sentences,
      sentences: @report.sentences
    }
  end

  def syllables
    @syllables = @report.words.collect do |word|
      [word, Lingua::EN::Syllable.syllables(word)]
    end
    
    render json: @syllables
  end

private

  def get_report
    @report = Lingua::EN::Readability.new(params[:text])
  end
end
