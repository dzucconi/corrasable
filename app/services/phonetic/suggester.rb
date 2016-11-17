module Phonetic
  class Suggester
    attr_reader :input, :sanitizer, :suggestions

    def initialize(input)
      @input = input
      @sanitizer = Sanitizer.new(input)
    end

    def suggest(token)
      algorithm = Phonetic::Index::DEFAULT_ALGORITHM

      criteria = {}.tap { |hsh| hsh[algorithm] = token.send(algorithm) }

      suggestions = Word.collection.aggregate([
        { '$match': criteria },
        { '$sample': { size: 3 } },
        { '$project': { word: 1 } }
      ]).to_a.map { |suggestion| suggestion['word'] }
    end

    def suggestions
      @suggestions ||= sanitizer.output.map do |tokens|
        results = Parallel.map(tokens) do |token|
          { token: token }.tap do |hsh|
            if /^\W$/ =~ token
              hsh[:suggestions] = []
            else
              hsh[:suggestions] = suggest(token)
            end
          end
        end

        suggestions = tokens.map do |token|
          results.find { |r| r[:token] == token }[:suggestions]
        end

        {
          tokens: tokens,
          suggestions: suggestions
        }
      end
    end
  end
end
