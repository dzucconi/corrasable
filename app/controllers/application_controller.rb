class ApplicationController < ActionController::API
  def home
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, fenced_code_blocks: true, hard_wrap: true, prettify: false)
    @output = markdown.render(File.open("#{Rails.root}/README.md").read)
    render html: "application/home", layout: "layouts/application"
  end
end
