# frozen_string_literal: true

module BattleNetClient
  # Namespace that contains all the game clients supports by the BattleNetClient.
  # Currently the following game clients are supported:
  #
  # - World of Warcraft
  module GameClients
    def world_of_warcraft
      @world_of_warcraft ||= begin
        client = WorldOfWarcraft.new
        client.locale = config.locale
        client.region = config.region
        client
      end
    end
  end
end
