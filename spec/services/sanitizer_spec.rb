require 'rails_helper'

RSpec.describe Sanitizer do
  describe 'is_number?' do
    it 'detects strings that are numeric' do
      expect(Sanitizer.is_number? '8').to be true
      expect(Sanitizer.is_number? '88').to be true
      expect(Sanitizer.is_number? '0').to be true
      expect(Sanitizer.is_number? 'eight').to be false
    end
  end

  describe 'output' do
    it 'produces a tokenized output of words' do
      s = Sanitizer.new('my favorite number is 8')
      expect(s.output).to eql [
        'my',
        'favorite',
        'number',
        'is',
        'eight'
      ]
    end

    it 'produces a flat output' do
      s = Sanitizer.new('number 88')
      expect(s.output).to eql ['number', 'eighty', 'eight']
    end
  end
end
