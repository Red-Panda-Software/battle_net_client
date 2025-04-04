# frozen_string_literal: true

require 'battle_net_client'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Load all support files
  Dir.glob(File.expand_path('support/*.rb', __dir__)).each { |f| require f }

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
