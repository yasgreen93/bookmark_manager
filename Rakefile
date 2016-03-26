require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc 'Non destructive upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts 'auto_upgrade complete: no data loss ;)'
  end

  desc 'Destructive upgrade'
  task :migrate do
    DataMapper.auto_migrate!
    puts 'auto_migrate complete: data was lost...:('
  end
end
