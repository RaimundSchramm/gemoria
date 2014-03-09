source 'https://rubygems.org'

gem 'rails4_upgrade'

gem 'rails', '4.0.3'
gem 'jquery-rails'
gem "thin"

gem 'sqlite3'
gem 'pg'

gem "haml"
gem "haml-rails"
gem "hpricot"
gem "ruby_parser"
gem "email_spec"

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'bootstrap-sass'

group :development, :test do
  # debugger
  gem 'debugger'

  # test framework for ruby and rails
  gem "rspec-rails", '~> 2.14.0'

  # test framework for javascript and jquery
  gem 'jasminerice', :git => 'https://github.com/bradphelan/jasminerice.git'

  # test framework for acceptance testing ruby, rails and javascript
  gem "capybara", '~> 1.1.0'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'poltergeist'

  # test fixtures replacement
  gem "factory_girl_rails", '~> 4.4.0'

  # automating on file change
  gem 'guard-rspec'     # for rspec-rails
  gem 'rb-inotify'#, '~> 0.8.8'
  gem 'libnotify'
  gem 'guard-livereload'# for assets
  gem 'guard-jasmine'   # for jasminerice, depends on phantomjs

  # for deployment
  gem 'capistrano'
  gem 'rvm-capistrano'
end

# dependency issues
gem 'rack'#, '1.4.1'
gem 'childprocess'#, '0.3.7'

gem 'travis-lint'

group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
end
