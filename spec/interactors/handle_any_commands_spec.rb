require 'spec_helper'

RSpec.describe HandleAnyCommands, type: :interactor do
  subject(:context) { HandleAnyCommands.call }
  describe '.call' do
    it 'succeeds' do
      expect(context.response.downcase).to eq('handle any commands')
      expect(context).to be_a_success
    end
  end
end
