##
# Pulls in weather information from the WeatherUnderground integration. Fails if API fails.
#

class CheckTheWeather
  include Interactor

  def call
    puts 'Check the weather'
    context.response = 'Check the weather'
  end
end
