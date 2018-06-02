require 'spec_helper'

RSpec.describe RecordDataPoint, type: :interactor do
  let(:user) { create(:user) }
  let(:weather) { Weather.new(pressure_mb: 1000.0, temp_c: 30.0) }
  subject(:context) { RecordDataPoint.call(user: user, weather: weather) }
  describe '.call' do
    it 'succeeds' do
      expect(context).to be_a_success
    end
  end
end
