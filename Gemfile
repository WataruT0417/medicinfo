source 'https://rubygems.org'

gem 'rails',        '5.2.1'
gem 'bootstrap-sass', '>= 3.4.1'
gem 'sass-rails'
gem 'puma',         '3.9.1'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'bootsnap', require: false
gem 'activestorage', '~> 5.2.0'
gem 'pry-rails'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
group :development, :test do
  gem 'mysql2', '0.5.2'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'guard-rspec', require: false
  gem 'database_rewinder', '0.9.1'
  gem 'rspec-request_describer', '0.2.2'
  gem 'autodoc', '0.7.2'
  gem 'json_spec', '1.1.5'
  gem 'capybara', '3.14.0'
  gem "selenium-webdriver", '3.141.0'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  #gem 'rails-controller-testing', '1.0.2'
  #gem 'minitest',                 '5.10.3'
  #gem 'minitest-reporters',       '1.1.14'
  #gem 'guard',                    '2.13.0'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]