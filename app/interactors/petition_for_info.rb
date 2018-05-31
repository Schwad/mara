# frozen_string_literal: true

##
# Interactor that petitions users for pain reading information.
class PetitionForInfo
  include Interactor

  def call
    context.response = 'Hello, it is your occasional reminder to submit your pain data! How are you feeling?'
  end
end
