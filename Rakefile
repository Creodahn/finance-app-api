# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :environment do
  Rollbar.configure do |config |
    config.access_token = '4506d206afb343349719bb4c97920bdf'
  end
end
