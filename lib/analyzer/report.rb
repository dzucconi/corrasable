module Analyzer
  class Report < Lingua::EN::Readability
    include ActiveModel::Serialization
  end
end
