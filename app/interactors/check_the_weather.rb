##
# Pulls in weather information from the WeatherUnderground integration. Fails if API fails.
#

class CheckTheWeather
  include Interactor

  def call
    puts 'Check the weather'
    context.response = 'Check the weather'
    w_api = Wunderground.new(ENV['WUNDERGROUND_API_KEY']).conditions_for("Lostwithiel, UK")['current_observation']
    context.pressure = w_api['pressure_mb'].to_f
    context.temperature = w_api['temp_c']
    context.full_weather_record = w_api
  end
end
