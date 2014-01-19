module Converter
  class Phoneme
    attr_reader :string, :tokenizer, :phonemes

    def initialize(string)
      @string    = string
      @tokenizer = Tokenizer::Tokenizer.new(:en)
    end

    def lines
      string.split("\n")
    end

    def tokenized_lines
      lines.map do |line|
        tokenizer.tokenize(line)
      end
    end

    def phonemes
      @phonemes ||= tokenized_lines.map do |words|
        words.map do |word|
          if /^\W$/ =~ word
            word
          else
            Word.phonemes(word)
          end
        end
      end
    end
  end # Phoneme
end # Converter
