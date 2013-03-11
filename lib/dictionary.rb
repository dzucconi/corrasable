class Dictionary
  DICTIONARIES = {
    en: "#{Rails.root}/db/cmudict.0.7a.txt"
  }
  
  def self.generate(language=:en)
    IO.foreach(DICTIONARIES[language]).each do |line|
      next if line !~ /^[A-Z]/
      
      line.chomp!

      (word, *phonemes) = line.split(/  ?/)

      # Ignore alternative pronunciations
      # 
      next if word =~ /\(\d\) ?$/
      
      syllables = phonemes.grep(/^[AEIUO]/).size
      
      create(word, phonemes, syllables, language)
    end
  end
  
  def self.create(word, phonemes, syllables, language=:en)
    puts "#{word} #{phonemes} - #{syllables} (#{language})"

    Word.create!(word: word.upcase, phonemes: phonemes, syllables: syllables.to_i, language: language)
  end
end
