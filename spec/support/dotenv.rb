# frozen_string_literal: true

# Configuration for DotEnv to ensure that we are loading the local and test files
# correctly. This guarantees that we are loading the correct environment variables
# for our test setup
#
# The correct load order is:
#   * .env
#   * .env.test
#   * .env.test.local
#   * .env.local
# The first matching pair that's found will be loaded into the ENV.
require 'dotenv'
Dotenv.load('.env.test')
