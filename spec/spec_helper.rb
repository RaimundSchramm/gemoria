require 'simplecov'

require 'rubygems'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'email_spec'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Capybara.javascript_driver = :poltergeist
Capybara.javascript_driver = :selenium
FactoryBot.reload

RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

  # This allows you to use the core set of syntax methods (build,
  # build_stubbed, create, attributes_for, and their *_list counterparts)
  # without having to call them on FactoryGirl directly
  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL
  config.include FeatureHelpers

  #config.include Capybara::DSL
  #config.include Capybara::RSpecMatchers

  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # set to false with Capybara + Database Cleaner
  # set to true with ActiveRecord::Base patch from Jose Valim and without Database Cleaner
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# RSpec 3.x - Deprecation-Warnings
# `mock_model` is deprecated. Use the `rspec-activemodel-mocks` gem instead. Called from /home/mund/projects/gemoria/spec/controllers/categories_controller_spec.rb:35:in `valid_session'.

# --------------------------------------------------------------------------------
# rspec-rails 3 will no longer automatically infer an example group's spec type
# from the file location. You can explicitly opt-in to this feature using this
# snippet:

# RSpec.configure do |config|
#   config.infer_spec_type_from_file_location!
# end

# If you wish to manually label spec types via metadata you can safely ignore
# this warning and continue upgrading to RSpec 3 without addressing it.
# --------------------------------------------------------------------------------


# If you need more of the backtrace for any of these deprecations to
# identify where to make the necessary changes, you can configure
# `config.raise_errors_for_deprecations!`, and it will turn the
# deprecation warnings into errors, giving you the full backtrace.

RSpec.configure do |config|
  config.detail_color = :magenta
  config.tty = true
  config.color = true
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
