module Converter
  class Phoneme
    attr_reader :input, :sanitizer, :phonemes

    def initialize(input)
      @input = input
      @sanitizer = Sanitizer.new(input)
    end

    def phonemes
      @phonemes ||= sanitizer.output.map do |tokens|
        tokens.map do |token|
          Word.phonemes(token)
        end
      end
    end
  end
end
