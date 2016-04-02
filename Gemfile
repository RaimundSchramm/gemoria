source 'https://rubygems.org'

# gem 'rails4_upgrade'

gem 'rails',                     '4.2.6'
gem 'jquery-rails',              '3.1.4'
gem 'thin',                      '1.6.4'

gem 'sqlite3',                   '~> 1.3.0'
# gem 'pg'

gem 'haml-rails',                '0.5.3'
gem 'sass-rails',                '4.0.5'
gem 'bootstrap-sass',            '3.3.5'
gem 'coffee-rails',              '4.1.1'
gem 'uglifier',                  '2.7.2'

# gem "hpricot"
# gem "ruby_parser"

gem 'email_spec',                '2.0.0'

# # Use ActiveModel has_secure_password
gem 'bcrypt',                    '3.1.11'

group :development, :test do
  gem 'spring',                  '1.6.4'
  gem 'byebug',                  '8.2.2'

#   # test framework for ruby and rails
  gem 'rspec-rails',             '3.4.2'
  gem 'rspec-activemodel-mocks', '1.0.3'

#   # test framework for acceptance testing ruby, rails and javascript
  gem 'capybara',                '2.6.2'
  gem 'database_cleaner',        '1.5.1'
  gem 'poltergeist',             '1.9.0'
  gem 'selenium-webdriver',      '2.53.0'

#   # test fixtures replacement
  gem 'factory_girl_rails',      '~> 4.4.0'

#   # automating on file change
  gem 'guard-rspec',             '~> 4.2.0' # for rspec-rails
    #   gem 'rb-inotify'#, '~> 0.8.8'
#  gem 'libnotify'
  gem 'guard-livereload',        '2.5.2' # for assets
  gem 'guard-jasmine',           '2.0.6' # for jasminerice, depends on phantomjs

  gem 'jasmine-jquery-rails',    '2.0.3'

#   # for deployment
  gem 'capistrano',              '2.15.7'
  gem 'rvm-capistrano',          '1.5.6'
end

# # dependency issues
# gem 'rack'#, '1.4.1'
# gem 'childprocess'#, '0.3.7'

# gem 'travis-lint'

group :test do
  gem 'simplecov',               '0.11.2', require: false
  gem 'shoulda-matchers',        '3.1.1'
end
