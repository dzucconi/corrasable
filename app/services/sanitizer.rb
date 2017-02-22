class Sanitizer
  TOKENIZER = Tokenizer::WhitespaceTokenizer.new.freeze

  attr_reader :input, :tokenizer, :lines

  def initialize(input)
    @input = input
    @lines = input.split("\n").map do |line|
      TOKENIZER.tokenize line
    end
  end

  def output
    lines.map do |tokens|
      tokens.map do |token|
        TOKENIZER.tokenize self.class.wordify(token)
      end.flatten
    end
  end

  def self.wordify(token)
    if self.number? token
      NumbersInWords.in_words token.to_i
    elsif self.symbol? token
      Sanitizer::Symbols.map token
    else
      token
    end
  end

  def self.symbol?(token)
    Sanitizer::Symbols.symbol? token
  end

  def self.number?(token)
    !(token =~ /\A[-+]?[0-9]+\z/).nil?
  end
end
