class Tagger
  attr_reader :text, :tagger, :tagged

  PARTS = %i(
    adjectives max_noun_phrases question_parts adverbs max_noun_regex readable base_present_verbs
    noun_phrases sentences comparative_adjectives nouns superlative_adjectives conjunctions passive_verbs
    verbs gerund_verbs past_tense_verbs words infinitive_verbs present_verbs interrogatives proper_nouns
  ).freeze

  def initialize(text)
    @text = text
    @tagger = EngTagger.new
    @tagged = @tagger.add_tags(@text)
  end

  PARTS.map do |part|
    define_method part.to_sym do
      @tagger.send("get_#{part}".to_sym, @tagged)
    end
  end
end
