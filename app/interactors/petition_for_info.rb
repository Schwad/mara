# frozen_string_literal: true

##
# Interactor that petitions users for pain reading information.
class PetitionForInfo
  include Interactor

  def call
    context.response = 'Checking in for a pain update - how are you feeling? (0-10)'
  end
end
