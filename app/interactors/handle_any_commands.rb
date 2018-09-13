# frozen_string_literal: true

##
# This is the interactor that terminates the message management process and processes any commands (if applicable). Examples could include "STOP", "HELP", etc.
#
class HandleAnyCommands
  include Interactor

  def call
    context.response = 'Handle Any Commands'
    @bot_command = BotCommand.new(context.incoming_message.split(" ")[0], context.incoming_message.split(" ")[1..-1].join(" "), context.user)
    if @bot_command.is_command?
      @bot_command.execute
      context.message.reply do |reply|
        reply.text = @bot_command.message
        reply.send_with(context.bot)
      end
      context.fail!
    end
  end
end
