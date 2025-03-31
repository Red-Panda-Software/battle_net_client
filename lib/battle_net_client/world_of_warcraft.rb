# frozen_string_literal: true

module BattleNetClient
  # BattleNetClient::WorldOfWarcraft
  #
  # This module provides methods to interact with the World of Warcraft API.
  module WorldOfWarcraft
    ACHIEVEMENTS_URL = 'https://%<region>s.api.blizzard.com/data/wow/achievement/index'

    def achievements(access_token:)
      return [] if config.region.blank?

      response = Faraday.get(achievement_url, static_parameters, { 'Authorization' => "Bearer #{access_token}" })
      json = parse_response(response)

      return [] if json.nil?

      json.fetch(:achievements, []).map do |achievement|
        BattleNetClient::Models::Achievement.new(id: achievement[:id], name: achievement[:name])
      end
    rescue ::Dry::Struct::Error, ::Oj::Error
      []
    end

    def achievement_url
      format(ACHIEVEMENTS_URL, region: config.region)
    end

    def static_parameters
      { namespace: "static-#{config.region}", locale: config.locale }
    end
  end
end
