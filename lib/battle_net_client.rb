# frozen_string_literal: true

# Require and configure Zeitwerk for autoloading our code
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.enable_reloading
loader.setup

# The root namespace for the BattleNetClient gem.
module BattleNetClient; end
