class ApplicationController < ActionController::API
  def home
    @output = Markdown.render(File.open("#{Rails.root}/README.md").read)

    render html: "application/home", layout: "layouts/application"
  end
end
