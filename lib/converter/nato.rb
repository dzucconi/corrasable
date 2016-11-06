module Converter
  class Nato
    attr_reader :string, :nato

    def initialize(string)
      @string = string
    end

    def lines
      string.split("\n")
    end

    def nato
      @nato ||= lines.map do |line|
        NATO::Text.new(line).to_nato
      end
    end
  end
end
