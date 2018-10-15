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
        reply.text = "We are afraid that '#{context.incoming_message}' is not a valid reply. Unless you are sending a valid command from the command list, please respond only with numbers from 0-10 so that they may be recorded. If something unexpected is happening here, get in touch with the maintainer at nicholas.schwaderer@gmail.com or on Telegram at @schwadererer."
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
