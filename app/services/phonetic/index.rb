module Phonetic
  class Index
    ALGORITHMS = %i(
      soundex refined_soundex metaphone double_metaphone metaphone2
      caverphone caverphone2 nysiis refined_nysiis dm_soundex
    ).freeze

    DEFAULT_ALGORITHM = :refined_soundex

    class << self
      def default(word)
        send(DEFAULT_ALGORITHM, word)
      end

      ALGORITHMS.map do |algorithm|
        define_method(algorithm.to_sym) do |word|
          word.send(algorithm.to_sym)
        end
      end
    end
  end
end
