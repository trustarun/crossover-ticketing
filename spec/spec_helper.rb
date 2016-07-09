# check below for configuration settings
# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'database_cleaner'
require 'factory_girl_rails'
require 'support/capybara'
require 'warden'
require 'devise'

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, type: :controller
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:suite) do
    begin
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
      # FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  config.before :suite do
    Warden.test_mode!
  end

  config.include FactoryGirl::Syntax::Methods
end
