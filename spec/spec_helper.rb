ENV['ENVIRONMENT'] = 'test'

require 'rake'
require 'vcr'
require 'webmock'

TWILIO_VARS = []
TWILIO_VARS << 'TWILIO_ACCOUNT_SID'
TWILIO_VARS << 'TWILIO_AUTH_TOKEN'
TWILIO_VARS << 'MY_TWILO_NUMBER'
TWILIO_VARS << 'CLIENT_NUMBER'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  TWILIO_VARS.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end

Rake.application.load_rakefile

RSpec.configure do |config|

  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
