##
# Issues a response to the user at the end of the process.
#

class ThankTheUser
  include Interactor

  def call
    puts 'Thank the user'
    context.message.reply do |reply|
      reply.text = "hello #{context.message.from.username} we would like to thank you for submitting this!"
      reply.send_with(context.bot)
    end
    context.response = 'Thank the user'
  end
end
