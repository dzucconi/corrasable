namespace :bootstrap do
  desc 'Seed database'
  task seed: :environment do
    Rake::Task['data:dictionary'].invoke
    Rake::Task['data:phonetic'].invoke
    Rake::Task['db:mongoid:remove_indexes'].invoke
  end
end
