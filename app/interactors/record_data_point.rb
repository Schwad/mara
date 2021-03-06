# frozen_string_literal: true

##
# The final interactor in the process if all has passed. Records the data point and corresponding information into the official logs.
#

class RecordDataPoint
  include Interactor

  def call
    datapoint = DataPoint.new
    datapoint.pressure = context.weather.pressure_mb
    datapoint.temperature = context.weather.temp_c
    datapoint.full_weather_record = context.full_weather_record
    datapoint.pain_level = context.incoming_message.to_f
    datapoint.user = context.user
    if datapoint.save && context.user.save
      context.response = 'Record Data Point'
    else
      context.fail!
    end
    puts 'Record Data Point'
  end
end
