# frozen_string_literal: true

##
# This stores the realtime pain data against weather. Often used data is accessed via the accessors associated with the `weather_data` store. A full snapshot of the weather for future use from Weather Underground is stored as a serialized hash in the `full_weather_record`.
#
class DataPoint < ApplicationRecord
  belongs_to :user
  store :weather_data, accessors: %i[pressure temperature], coder: JSON
  serialize :full_weather_record, Hash
end
