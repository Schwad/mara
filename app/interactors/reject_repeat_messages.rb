# frozen_string_literal: true

##
# Tracks message id's to ensure there are no repeats
#

class RejectRepeatMessages
  include Interactor

  def call
    current_messages_ids = MessageTrack.all.pluck(:message_id)
    if current_messages_ids.include?(context.message.id)
      context.fail!
    else
      MessageTrack.create(message_id: context.message.id)
    end
  end
end
