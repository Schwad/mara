# frozen_string_literal: true

##
# Model used as a Ruby wrapper for the API response of weather underground
class Weather
  include Virtus.model

  attribute :pressure_mb, Float
  attribute :temp_c, Float
end
