require 'rails_helper'

RSpec.describe Word do
  describe 'sanitize' do
    it 'converts the input into a queryable token by stripping punctuation' do
      expect(Word.sanitize('hello,'))
        .to eql 'HELLO'

      expect(Word.sanitize('hello/world'))
        .to eql 'HELLOWORLD'
    end

    it 'converts the input into a queryable token by handling rsquos' do
      expect(Word.sanitize('you’re'))
        .to eql 'YOU\'RE'
    end
  end
end
