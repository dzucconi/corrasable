class Sanitizer
  attr_reader :input, :tokenizer, :tokens

  def initialize(input)
    @input = input
    @tokenizer = Tokenizer::WhitespaceTokenizer.new
    @tokens = @tokenizer.tokenize(input)
  end

  def output
    tokens.map do |token|
      if self.class.is_number?(token)
        tokenizer.tokenize(NumbersInWords.in_words token.to_i)
      else
        token
      end
    end.flatten
  end

  def self.is_number?(token)
    !!(token =~ /\A[-+]?[0-9]+\z/)
  end
end
