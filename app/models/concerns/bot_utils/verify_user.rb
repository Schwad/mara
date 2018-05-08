module BotUtils

  ##
  # This is utilized by MaraBot to ensure that it only communicates with existing users, by checking against current friendly names.
  module VerifyUser
    extend ActiveSupport::Concern

    included do

      ##
      # Verifies current user, if not it kills any checks and also supports ratelimiting.
      #
      def verify_user(message)
        puts 'Verifying...'
        message.reply do |reply|
          if message.from.username == 'schwadererer'
            reply.text = 'Confirming message'
          else
            reply.text = 'mmmmno wai'
          end
          reply.send_with(@bot)
        end
      end
    end
  end
end
