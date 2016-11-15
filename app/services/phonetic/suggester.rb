module Phonetic
  class Suggester
    attr_reader :input, :sanitizer, :suggestions

    def initialize(input)
      @input = input
      @sanitizer = Sanitizer.new(input)
    end

    def suggestions
      @suggestions ||= sanitizer.output.map do |tokens|
        tokens.reduce({}) do |memo, token|
          if /^\W$/ =~ token
            memo[token] = []
          else
            algorithm = Phonetic::Index::DEFAULT_ALGORITHM
            criteria = {}.tap { |hsh| hsh[algorithm] = token.send(algorithm) }
            memo[token] = Word.where(criteria).sample(3).map(&:word)
          end

          memo
        end
      end
    end
  end
end
