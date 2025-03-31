# frozen_string_literal: true

module BattleNetClient
  # This module serves as a namespace to contain all models used by the client.
  # These models are used to represent the data in proper PORO objects instead
  # of working with raw JSON Hash objects.
  module Models
    require 'dry-types'
    require 'dry-struct'

    # models for defining the types of the attributes.
    module Types
      include ::Dry.Types()
    end
  end
end
