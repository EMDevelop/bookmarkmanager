require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../app/app'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.configure do |config|
  config.run_server = false
  config.server = :webrick
  config.default_driver = :selenium
  config.app = BookmarkManager
  config.app_host = "localhost:9292"
end

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end

ENV['RACK_ENV'] = 'test'
