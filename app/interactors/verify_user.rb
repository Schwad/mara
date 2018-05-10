##
# Interactor object that runs at the front of the `ManageMessage` interactor, ensuring that all handled messages are from verified users. Rate limits if not.
#

class VerifyUser
  include Interactor

  def call
    puts 'Verify User interactor'
    if !User.exists?(friendly_name: context.message.from.username)
      puts 'Failed interactor'
      context.message.reply do |reply|
        reply.text = "hello #{context.message.from.username} from verify user, you are *not* authorized"
        reply.send_with(context.bot)
      end
      context.fail!
    end
    context.response = 'Verify User interactor'
  end
end