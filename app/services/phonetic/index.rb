module Phonetic
  class Index
    ALGORITHMS = %i(
      soundex refined_soundex metaphone double_metaphone metaphone2
      caverphone caverphone2 nysiis refined_nysiis dm_soundex
    ).freeze

    DEFAULT_ALGORITHM = :soundex

    class << self
      def default(token)
        send(DEFAULT_ALGORITHM, token)
      end

      ALGORITHMS.map do |algorithm|
        define_method(algorithm.to_sym) do |token|
          token.send(algorithm.to_sym)
        end
      end
    end
  end
end
