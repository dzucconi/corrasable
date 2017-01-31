namespace :data do
  desc 'Seed database with words from CMUdict'
  task dictionary: :environment do
    Dictionary.generate(:en)
  end

  desc 'Cache phonetic indexes on Words'
  task phonetic: :environment do
    puts 'Loading'

    all = Word.all

    puts "#{all.size} Words"

    all.each do |word|
      puts word.word

      Phonetic::Index::ALGORITHMS.each do |algorithm|
        word[algorithm] = word.send(algorithm).presence || Phonetic::Index.send(algorithm, word.word)
      end

      word.save!
    end
  end
end
