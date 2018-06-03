# frozen_string_literal: true

##
# Pulls in weather information from the WeatherUnderground integration. Fails if API fails.
#
class CheckTheWeather
  include Interactor

  def call
    puts 'Check the weather'
    context.response = 'Check the weather'
    w_api = Wunderground.new(ENV['WUNDERGROUND_API_KEY']).conditions_for(context.user.location.delete(' '))['current_observation']
    if w_api.blank?
      context.message.reply do |reply|
        reply.text = "hello again #{context.message.from.username}! For some reason our API is not able to get weather info from your location.\n\n If this keeps happening let Nick know and try to make a note of where you are. He can be reached at nicholas.schwaderer@gmail.com"
        reply.send_with(context.bot)
      end
      context.fail!
    end
    context.weather = Weather.new(w_api)
    context.full_weather_record = w_api
  end
end
