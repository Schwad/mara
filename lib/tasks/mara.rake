namespace :mara do
  # Deprecated sidekiq interface
  #
  # desc 'initializes mara bot'
  # task start: :environment do
  #   MaraBot.perform_async
  # end
  #
  # desc 'destroys all Sidekiq processes'
  # task kill: :environment do
  #   Sidekiq.redis { |conn| conn.flushdb }
  # end
  #
  # desc 'kills and resets mara, needed for updating bot'
  # task reset: :environment do
  #   system('rake mara:kill')
  #   system('rake mara:start')
  #   puts 'MaraBot reset!'
  # end
  desc 'seeds data for datapoints'
  task seed: :environment do
    10.times do
      User.create(
        email: Faker::Internet.email,
        password: SecureRandom.hex(20),
        friendly_name: "#{Faker::Name.last_name}-control-group"
      )
    end
    iterator = 1
    10000.times do
      puts "Now doing datapoint #{iterator}"
      iterator +=1
      current_weather = nil
      while current_weather.nil?
        current_weather = Wunderground.new(Rails.application.credentials[Rails.env.to_sym][:wunderground_api_key]).conditions_for("#{Faker::Address.latitude},#{Faker::Address.longitude}")['current_observation']
      end
      weather = Weather.new(current_weather)
      datapoint = DataPoint.new
      datapoint.pressure = weather.pressure_mb
      datapoint.temperature = weather.temp_c
      datapoint.full_weather_record = current_weather
      datapoint.pain_level = (0..10).to_a.sample
      datapoint.user = User.all.sample
      datapoint.save
      fail unless datapoint.valid?
    end
  end
end
