# frozen_string_literal: true

module BattleNetClient
  module GameClients
    # BattleNetClient::WorldOfWarcraft
    #
    # This module provides methods to interact with the World of Warcraft API.
    class WorldOfWarcraft < Base
      ACHIEVEMENTS_URL = 'https://%<region>s.api.blizzard.com/data/wow/achievement/index'

      def achievements(access_token:)
        return [] if config.region.blank?

        response = Faraday.get(achievement_url, static_parameters, headers(access_token:))
        json = ::Oj.load(response.body, symbol_keys: true)

        return [] if json.nil?

        json.fetch(:achievements, []).map do |achievement|
          BattleNetClient::Models::Achievement.new(id: achievement[:id], name: achievement[:name])
        end
      end

      private

      def achievement_url
        format(ACHIEVEMENTS_URL, region: config.region)
      end

      def static_parameters
        { namespace: "static-#{config.region}", locale: config.locale }
      end

      def headers(access_token:)
        { 'Authorization' => "Bearer #{access_token}" }
      end
    end
  end
end
