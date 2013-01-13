source 'https://rubygems.org'

gem 'rails',              '3.2.9'
gem 'jquery-rails'
gem "thin"

gem 'sqlite3'
gem 'pg'

gem "haml"
gem "haml-rails"
gem "hpricot"
gem "ruby_parser"
gem "email_spec"

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bootstrap-sass'
end

group :development, :test do
  # debugger
  gem 'debugger'

  # test framework for ruby and rails
  gem "rspec-rails"

  # test framework for javascript and jquery
  gem 'jasminerice'

  # test framework for acceptance testing ruby, rails and javascript
  gem "capybara"
  gem 'launchy'
  gem 'database_cleaner'

  # test fixtures replacement
  gem "factory_girl_rails"

  # drb server for automated tests
  gem 'spork-rails'

  # automating on file change
  gem 'guard-rspec'     # for rspec-rails
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'     # for spork-rails
  gem 'guard-livereload'# for assets
  gem 'guard-jasmine'   # for jasminerice, depends on phantomjs

  # for deployment
  gem 'capistrano'
  gem 'rvm-capistrano'
end
