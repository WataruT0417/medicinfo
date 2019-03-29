require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include JsonSpec::Helpers
  config.include RSpec::RequestDescriber, type: :request




  config.before :all do
    #FactoryBot.reload
    #DatabaseCleaner.start
  end

  config.before :suite do
    DatabaseRewinder.clean_all
    DatabaseCleaner.strategy = :truncation
    ActiveRecord::Base.connection.execute('ALTER TABLE staffs AUTO_INCREMENT = 1')
    load Rails.root.join('db', 'seeds.rb')
  end

  config.after :each do
    DatabaseCleaner.clean_with :truncation, { except: %w(staffs) }
  end
  
  config.after :suite do
    DatabaseRewinder.clean
  end
  Autodoc.configuration.toc = true
end
