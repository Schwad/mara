##
# The primary interfact with which the application interacts with the telegram api via the telegram_bot gem.
#
# It currently does not process state or 'remember' conversations, so does not have persistence handling. This is likely to be developed at some point in the future.
# Any bot interactions must be done explicitly through this object and not directly through the Telegram_Bot.

class MaraBot

  MARA_BOT_KEY = ENV['mara_bot_key']

  ##
  # Instantiates the bot variable as a new Telegram bot.
  #

  def initialize
    @bot = TelegramBot.new(token: MARA_BOT_KEY)
  end

  ##
  # Runs the bot, it must always be running 'live' on its own process/worker in
  # order to receive updates.

  def run
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        case command
        when /greet/i
          reply.text = "Hello, #{message.from.first_name}!"
        else
          reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(@bot)
      end
    end
  end


end
