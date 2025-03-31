# frozen_string_literal: true

module BattleNetClient
  module Models
    # This class represents an access token response from the Battle.net API.
    # This token is used to authenticate requests to the API, and is bound to a specific user,
    # as well as the scope that was requested for that token.
    class AccessToken < ::Dry::Struct
      DEFAULT_SCOPE = 'openid'

      attribute :access_token, Types::String
      attribute :expires_in, Types::Integer
      attribute :scope, Types::String.default(DEFAULT_SCOPE)
      attribute :sub, Types::String
      attribute :token_type, Types::String
    end
  end
end
