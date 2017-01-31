class Dictionary
  DICTIONARIES = {
    en: "#{Rails.root}/db/cmudict.0.7a.txt"
  }.freeze

  def self.generate(language = :en, silent = false)
    IO.foreach(DICTIONARIES[language]).each do |line|
      next if line !~ /^[A-Z]/

      line.chomp!

      (word, *phonemes) = line.split(/  ?/)

      # Ignore alternative pronunciations
      next if word =~ /\(\d\) ?$/

      # Count the number of stressed vowels
      syllables = phonemes.grep(/^[AEIUO]/).size

      create(word, phonemes, syllables, language, silent)
    end
  end

  def self.create(word, phonemes, syllables, language = :en, silent = false)
    puts "#{word} #{phonemes} - #{syllables} (#{language})" unless silent

    Word.create!(word: word.upcase, phonemes: phonemes, syllables: syllables.to_i, language: language)
  end
end
