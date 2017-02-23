class Sanitizer
  WHITESPACE = Regexp.new('[[:blank:]]+')

  attr_reader :input, :tokenizer, :lines

  class << self
    def tokenize(input)
      input.chomp.strip.split(WHITESPACE)
    end

    def wordify(token)
      if self.number? token
        NumbersInWords.in_words token.to_i
      elsif self.symbol? token
        Sanitizer::Symbols.map token
      else
        token
      end
    end

    def symbol?(token)
      Sanitizer::Symbols.symbol? token
    end

    def number?(token)
      !(token =~ /\A[-+]?[0-9]+\z/).nil?
    end
  end

  def initialize(input)
    @input = input
    @lines = input.split("\n").map do |line|
      self.class.tokenize line
    end
  end

  def output
    lines.map do |tokens|
      tokens.map do |token|
        self.class.tokenize self.class.wordify(token)
      end.flatten
    end
  end
end
