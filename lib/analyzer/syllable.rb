module Analyzer
  class Syllable
    attr_reader :string,
                :syllables

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
  end # Syllable
end # Analyzer
