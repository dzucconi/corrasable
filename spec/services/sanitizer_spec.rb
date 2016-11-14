require 'rails_helper'

RSpec.describe Sanitizer do
  describe 'number?' do
    it 'detects strings that are numeric' do
      expect(Sanitizer.number?('8')).to be true
      expect(Sanitizer.number?('88')).to be true
      expect(Sanitizer.number?('0')).to be true
      expect(Sanitizer.number?('eight')).to be false
    end
  end

  describe 'output' do
    it 'produces a tokenized output of words' do
      s = Sanitizer.new('my favorite number is 8')
      expect(s.output).to eql [%w(
        my
        favorite
        number
        is
        eight
      )]
    end

    it 'produces a flat output' do
      s = Sanitizer.new('number 88')
      expect(s.output).to eql [%w(number eighty eight)]
    end
  end
end
