# frozen_string_literal: true

##
# Pulls in weather information from the WeatherUnderground integration. Fails if API fails.
#
class CheckTheWeather
  include Interactor

  def call
    puts 'Check the weather'
    context.response = 'Check the weather'
    w_api = Wunderground.new(ENV['WUNDERGROUND_API_KEY']).conditions_for("Lostwithiel, UK")['current_observation']
    context.weather = Weather.new(w_api)
    context.full_weather_record = w_api
  end
end
