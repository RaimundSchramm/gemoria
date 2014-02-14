source 'http://rubygems.org'

gem 'rails', '3.2.16'
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
gem 'bcrypt-ruby', '~> 3.0.0'

#group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '>= 1.0.3'
  gem 'bootstrap-sass', '~> 3.1.1'
#end

group :development, :test do
  # debugger
  # gem 'debugger'

  # test framework for ruby and rails
  gem "rspec-rails"

  # test framework for javascript and jquery
  gem 'jasminerice'

  # test framework for acceptance testing ruby, rails and javascript
  gem "capybara", '~> 1.1.0'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'poltergeist'

  # test fixtures replacement
  gem "factory_girl_rails"

  # drb server for automated tests
  gem 'spork-rails'

  # automating on file change
  gem 'guard-rspec'     # for rspec-rails
  gem 'rb-inotify'#, '~> 0.8.8'
  gem 'libnotify'
  gem 'guard-spork', github: 'guard/guard-spork'#, branch: 'master'     # for spork-rails
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

