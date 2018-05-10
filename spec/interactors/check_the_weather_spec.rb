require 'spec_helper'

RSpec.describe CheckTheWeather, type: :interactor do
  subject(:context) { CheckTheWeather.call }
  describe '.call' do
    it 'succeeds' do
      expect(context.response).to eq('Check the weather')
      expect(context).to be_a_success
    end
  end
end
