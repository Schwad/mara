# frozen_string_literal: true

##
# This is the interactor that terminates the message management process and signs up a new user.
#
class SignupUser
  include Interactor

  def call
    context.incoming_message = context.message.get_command_for(context.bot)
    return if context.message.location
    if context&.incoming_message&.split(" ")[0].downcase == 'signup'
      if User.where(friendly_name: context.message.from.username).count > 0
        context.message.reply do |reply|
          reply.text = "You already signed up! 😊"
          reply.send_with(context.bot)
        end
        context.fail!
      else
        user = User.create(
          email: "#{SecureRandom.hex(20)}@gmail.com",
          name: context.message.from.username || context.message.from.first_name,
          friendly_name: context.message.from.username || context.message.from.first_name,
          chat_id: context.message.chat.id,
          password: SecureRandom.hex(20)
        )
        if user.save
          @signup_message = 'You are now signed up to marabot! Welcome!'
        else
          @signup_message = "Hmm, looks like there was an error. Try again, or contact nicholas.schwaderer@gmail.com for more help! Errors are #{user.errors.full_messages.join(",")}"
        end
        context.message.reply do |reply|
          reply.text = @signup_message
          reply.send_with(context.bot)
        end
        context.fail!
      end
    end
  end
end
