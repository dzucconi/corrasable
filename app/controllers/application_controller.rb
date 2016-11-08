class ApplicationController < ActionController::Base
  def home
    @output = HTML.render(File.open("#{Rails.root}/README.md").read)
  end
end
