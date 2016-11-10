require 'rails_helper'

RSpec.describe HTML do
  describe 'render' do
    it 'renders the Markdown to HTML' do
      expect(HTML.render('*hello* **world**'))
        .to eql("<p><em>hello</em> <strong>world</strong></p>\n")
    end
  end
end
