describe Weather do
  it { should respond_to(:pressure_mb) }
  it { should respond_to(:temp_c) }

  it "builds a weather object upon successful WeatherUnderground response" do
    VCR.use_cassette 'model/weather' do
      weather = Weather.new(Wunderground.new(ENV['WUNDERGROUND_API_KEY']).conditions_for('Lostwithiel, UK')['current_observation'])
      expect(weather.temp_c).not_to be_nil
      expect(weather.pressure_mb).not_to be_nil
    end
  end
end
