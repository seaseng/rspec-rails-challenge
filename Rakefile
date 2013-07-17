#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DbcRspecRails::Application.load_tasks

desc 'Stop Drop and Load'
task "reset" do
  exec "bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed && bundle exec rake db:test:prepare"
end


desc 'Stop Drop and Load'
task "start" do
  exec "bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed && bundle exec rake db:test:prepare"
end
