source 'https://rubygems.org'

gem 'rails',                     '4.2.11'
gem 'thin',                      '1.6.4'

gem 'sqlite3',                   '~> 1.3.0'
group :production do
  gem 'pg',                      '0.18.4'
end

gem 'jquery-rails',              '4.1.1'
gem 'jquery-ui-rails'
gem 'haml-rails',                '0.9.0'
gem 'sass-rails'
gem 'bootstrap-sass',            '3.3.6'
gem 'coffee-rails',              '4.1.1'
gem 'uglifier',                  '3.0.0'
gem 'turbolinks',                '2.5.3'

gem 'jbuilder',                  '~> 2.0'

group :doc do
  gem 'sdoc',                    '~> 0.4.0'
end

gem 'email_spec',                '2.0.0'

gem 'bcrypt',                    '3.1.11'

gem 'simple_form'

group :development do
  # for deployment
  gem 'capistrano',              '2.15.7' #see capistrano-rails
  gem 'rvm-capistrano',          '1.5.6'
  gem 'web-console',             '~> 2.0'
end

group :development, :test do
  gem 'byebug',                  '8.2.2'

  # test framework for ruby and rails
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  #gem 'rubocop-rspec'# needs Ruby >= 2.2 -.-

  # test framework for acceptance testing ruby, rails and javascript
  gem 'capybara',                '2.6.2'
  gem 'database_cleaner',        '1.5.1'
  gem 'poltergeist',             '1.9.0'
  gem 'selenium-webdriver',      '2.53.0'

  # test fixtures replacement
  gem 'factory_bot_rails'

  # automating on file change
  #gem 'guard-rspec',             '4.6.5' # for rspec-rails
    #   gem 'rb-inotify'#, '~> 0.8.8'
#  gem 'libnotify'
  #gem 'guard-livereload',        '2.5.2' # for assets
  #gem 'guard-jasmine',           '2.0.6' # for jasminerice, depends on phantomjs

  gem 'jasmine-jquery-rails',    '2.0.3'
end

# dependency issues
# gem 'rack'#, '1.4.1'
# gem 'childprocess'#, '0.3.7'

# gem 'travis-lint'

group :test do
  gem 'simplecov',               '0.11.2', require: false
  gem 'shoulda-matchers',        '3.1.1'
end
