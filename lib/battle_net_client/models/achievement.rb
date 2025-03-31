# frozen_string_literal: true

module BattleNetClient
  module Models
    # This class represents an Achievement retrieved from the Blizzard World of Warcraft API.
    # It consists of an ID and a name.
    class Achievement < ::Dry::Struct
      attribute :id, Types::Integer
      attribute :name, Types::String
    end
  end
end
