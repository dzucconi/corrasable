module Converter
  class Phoneme
    attr_reader :input, :sanitizer, :phonemes

    def initialize(input)
      @input = input
      @sanitizer = Sanitizer.new(input)
    end

    def phonemes
      @phonemes ||= sanitizer.output.map do |token|
        if /^\W$/ =~ token
          token
        else
          Word.phonemes(token)
        end
      end
    end
  end
end
