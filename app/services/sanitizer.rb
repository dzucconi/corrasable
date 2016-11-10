class Sanitizer
  attr_reader :input, :tokenizer, :lines

  def initialize(input)
    @input = input
    @tokenizer = Tokenizer::WhitespaceTokenizer.new
    @lines = input.split("\n").map do |line|
      @tokenizer.tokenize line
    end
  end

  def output
    lines.map do |tokens|
      tokens.map do |token|
        if self.class.is_number?(token)
          tokenizer.tokenize(NumbersInWords.in_words token.to_i)
        else
          token
        end
      end.flatten
    end
  end

  def self.is_number?(token)
    !!(token =~ /\A[-+]?[0-9]+\z/)
  end
end
