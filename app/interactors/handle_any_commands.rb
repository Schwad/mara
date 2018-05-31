# frozen_string_literal: true

##
# This is the interactor that terminates the message management process and processes any commands (if applicable). Examples could include "STOP", "HELP", etc.
#
class HandleAnyCommands
  include Interactor

  def call
    context.response = 'Handle Any Commands'
  end
end
