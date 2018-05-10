require 'spec_helper'

RSpec.describe RecordDataPoint, type: :interactor do
  subject(:context) { RecordDataPoint.call }
  describe '.call' do
    it 'succeeds' do
      expect(context.response.downcase).to eq('record data point')
      expect(context).to be_a_success
    end
  end
end
