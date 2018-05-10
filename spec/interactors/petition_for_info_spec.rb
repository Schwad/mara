require 'spec_helper'

RSpec.describe PetitionForInfo, type: :interactor do
  subject(:context) { PetitionForInfo.call }
  describe '.call' do
    it 'succeeds' do
      expect(context.response.downcase).to eq('hello, it is your occasional reminder to submit your pain data! how are you feeling?')
      expect(context).to be_a_success
    end
  end
end
