# frozen_string_literal: true

##
# Interactor that petitions users for pain reading information.
class PetitionForInfo
  include Interactor

  def call
    context.response = ['Checking in for a pain update - how are you feeling? (0-10)', 'How is your pain level doing? (0-10)', 'Hello 👋- time for a random pain check, how are you? (0-10)'].sample
  end
end
