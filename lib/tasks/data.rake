namespace :data do
  desc 'Seed database with words from CMUdict'
  task dictionary: :environment do
    Dictionary.generate(:en, true)
  end

  desc 'Cache phonetic indexes on Words'
  task phonetic: :environment do
    Word.all.each do |word|
      Phonetic::Index::ALGORITHMS.each do |algorithm|
        word[algorithm] = word.send(algorithm).presence || Phonetic::Index.send(algorithm, word.word)
      end
      word.save!
    end
  end
end
