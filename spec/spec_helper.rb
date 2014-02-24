require 'rubygems'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'email_spec'
require 'rspec/autorun'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/rails'

Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  #config.include Capybara::DSL
  #config.include Capybara::RSpecMatchers
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
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

  # This allows you to use the core set of syntax methods (build,
  # build_stubbed, create, attributes_for, and their *_list counterparts)
  # without having to call them on FactoryGirl directly
  config.include FactoryGirl::Syntax::Methods

  config.include Capybara::DSL
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  # end
   
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
   
  config.after(:each) do
    # DatabaseCleaner.clean
    Userstory.delete_all
    Project.delete_all
    Sprint.delete_all
    AcceptanceTest.delete_all
    Task.delete_all
    Category.delete_all
    User.delete_all
    Role.delete_all
  end

  config.include FeatureHelpers
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @shared_connection || retrieve_connection
  end
end

# # Forces all threads to share the same connection. This works on Capybara
# # because it starts the web server in a thread
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

FactoryGirl.reload
