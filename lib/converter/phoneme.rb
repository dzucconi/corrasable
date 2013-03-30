module Converter
  class Phoneme
    attr_reader :string,
                :phonemes

    def initialize(string)
      @string = string
    end

    def lines
      string.split("\n")
    end

    def tokenized_lines
      lines.map do |line|
        Tokenizer::Tokenizer.new.tokenize(line)
      end
    end

    def phonemes
      @phonemes ||= tokenized_lines.map do |words|
        words.map { |word| Word.phonemes(word) }
      end
    end
  end # Phoneme
end # Converter
