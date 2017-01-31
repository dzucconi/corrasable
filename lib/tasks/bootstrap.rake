namespace :bootstrap do
  desc 'Seed database'
  task seed: :environment do
    Rake::Task['data:dictionary'].invoke
    Rake::Task['db:mongoid:create_indexes'].invoke
  end
end
