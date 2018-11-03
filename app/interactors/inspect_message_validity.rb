# frozen_string_literal: true

##
# Ensures that the submitted message is valid.
#
class InspectMessageValidity
  include Interactor

  def call
    puts 'Inspect message validity'
    if non_integer_value || value_too_large
      context.message.reply do |reply|
        reply.text = "Woops! 😟 '#{context.incoming_message}' is not a valid reply or command.\n\n You can send numbers from 0-10 so that to be recorded. You can also sleep notifications like: 'sleep 3 days' or 'sleep 12 hours'. If something unexpected is happening here, get in touch with the maintainer at nicholas.schwaderer@gmail.com or on Telegram at @schwadererer."
        reply.send_with(context.bot)
      end
      context.fail!
    end
  end

  private

  def non_integer_value
    ( context.incoming_message.to_f == 0.0 && context.incoming_message != '0' )
  end

  def value_too_large
    context.incoming_message.to_f > 10.0
  end
end
