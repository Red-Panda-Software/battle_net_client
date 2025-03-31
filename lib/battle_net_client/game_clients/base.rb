# frozen_string_literal: true

require 'active_support/configurable'

module BattleNetClient
  module GameClients
    # The base class fo all game clients.
    # Contains shared code that is used by all game clients.
    class Base
      include ::ActiveSupport::Configurable

      config_accessor :locale, default: Client::DEFAULT_LOCALE
    end
  end
end
