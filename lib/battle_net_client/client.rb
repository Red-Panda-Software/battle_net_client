# frozen_string_literal: true

require 'active_support/configurable'
require 'base64'
require 'oj'
require 'faraday'

module BattleNetClient
  # This is the base client class for Battle.net API and holds the configuration needed to communicate
  # with the Blizzard API endpoint to retrieve data about games, characters, and other information.
  #
  # The following properties can be configured on the client:
  # - `client_id`: The client ID for the Battle.net API.
  # - `client_secret`: The client secret for the Battle.net API.
  # - `region`: The region for the Battle.net API (e.g., 'us', 'eu', 'kr', 'tw').
  # - `locale`: The locale for the Battle.net API (e.g., 'en_US', 'fr_FR', etc.).
  #
  # For usage on the various endpoints supported by the client, please see the individual
  # included modules that contain the required access logic.
  class Client
    include ActiveSupport::Configurable

    BATTLE_NET_BASE_URL = 'https://us.battle.net'
    BATTLE_NET_OAUTH_URL = '/oauth/token'
    BATTLE_NET_OAUTH_PAYLOAD = 'grant_type=client_credentials'
    BATTLE_NET_USER_INFO_URL = '/oauth/userinfo'

    config_accessor :client_id, :client_secret, :region, :locale

    def access_token
      return nil if client_id.blank? || client_secret.blank?

      credentials = Base64.strict_encode64("#{config.client_id}:#{config.client_secret}")
      headers = { 'Authorization' => "Basic #{credentials}", 'Accept' => 'application/json' }
      connection = Faraday.new(url: BATTLE_NET_BASE_URL, headers:)
      response = connection.post(BATTLE_NET_OAUTH_URL) { |req| req.body = BATTLE_NET_OAUTH_PAYLOAD }
      json = Oj.load(response.body, symbol_keys: true)

      BattleNetClient::Models::AccessToken.new(**json)
    rescue Dry::Struct::Error
      nil
    end
  end
end
