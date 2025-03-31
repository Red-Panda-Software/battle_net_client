# frozen_string_literal: true

require 'vcr'

# Configuration for VCR to filter out the required secrets
# as well as ensure all cassettes are configured properly.
VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :faraday
  config.configure_rspec_metadata!

  # Filter sensitive data
  config.filter_sensitive_data('<CLIENT_ID>') { ENV.fetch('BATTLE_NET_CLIENT_ID', nil) }
  config.filter_sensitive_data('<CLIENT_SECRET>') { ENV.fetch('BATTLE_NET_CLIENT_SECRET', nil) }
  config.filter_sensitive_data('<BASIC_AUTH>') do
    client_id = ENV.fetch('BATTLE_NET_CLIENT_ID', nil)
    client_secret = ENV.fetch('BATTLE_NET_CLIENT_SECRET', nil)
    "Basic #{Base64.strict_encode64("#{client_id}:#{client_secret}")}"
  end
  config.filter_sensitive_data('<HTTP_AUTHORIZATION>') { /Bearer [a-zA-Z0-9\-_]+/ }
end
