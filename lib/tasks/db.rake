namespace :db do
  desc "TODO"
  task recycle: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    puts "seeding db..."
    Rake::Task["db:seed"].invoke
    puts "done"
  end

end
