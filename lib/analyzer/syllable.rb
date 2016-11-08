module Analyzer
  class Syllable
    attr_reader :string, :tokenizer, :syllables

    def initialize(string)
      @string = string
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

    def syllables
      @syllables ||= tokenized_lines.map do |words|
        words.map do |word|
          if /^\W$/ =~ word
            { word => 0 }
          else
            { word => Word.syllables(word) }
          end
        end
      end
    end
  end
end
