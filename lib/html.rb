class HTML
  DEFAULTS = {
    autolink: true,
    fenced_code_blocks: true,
    hard_wrap: true,
    prettify: false,
    tables: true
  }.freeze

  RENDERER = Redcarpet::Render::HTML

  def self.render(string)
    Redcarpet::Markdown.new(RENDERER, DEFAULTS).render(string)
  end
end
