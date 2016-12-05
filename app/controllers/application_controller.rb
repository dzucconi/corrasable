class ApplicationController < ActionController::Base
  after_action :allow_iframe

  def home
    @output = HTML.render(File.open("#{Rails.root}/README.md").read)
  end

private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
