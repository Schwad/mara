# frozen_string_literal: true

##
# The primary interfact with which the application interacts with the telegram api via the telegram_bot gem.
#
# It currently does not process state or 'remember' conversations, so does not have persistence handling. This is likely to be developed at some point in the future.
# Any bot interactions must be done explicitly through this object and not directly through the Telegram_Bot.
class MaraBot
  include Sidekiq::Worker
  include BotUtils

  ##
  # Environment variable for main mara bot.
  #

  MARA_BOT_KEY = ENV['mara_bot_key']

  ##
  # Instantiates the bot variable as a new Telegram bot.
  #

  def initialize
    @bot = TelegramBot.new(token: MARA_BOT_KEY)
  end

  ##
  # Runs the bot as a webhook instance.
  #
  def receive_webhook(message)
    ManageMessage.call(bot: @bot, message: TelegramBot::Message.new(message.permit!.to_hash))
  end

  ##
  # Runs the bot, it must always be running 'live' on its own process/worker in
  # order to receive updates. This is done via the Procfile. This is a tertiary approach that may be useful for development, but live in production this will act with a webhook approach throuh `#receive_webhook`
  def perform
    @bot.get_updates(fail_silently: true) do |message|
      ManageMessage.call(bot: @bot, message: message)
    end
  end

  ##
  # This method allows developers direct access to the utilities of TelegramBot through MaraBot
  #
  def core
    @bot
  end

  ##
  # Pings the user to request for new data inputs, called in a rake task and called via a scheduler.
  #
  # The pings and receipt performance are not 'linked' in a conversation and are unrelated.

  def ping_user user
    channel = TelegramBot::Channel.new(username: user.friendly_name, id: user.chat_id)
    out_message = TelegramBot::OutMessage.new(chat: channel, text: PetitionForInfo.call(user: user).response)
    @bot.send_message(out_message)
  end

  ##
  # This is a utility to allow for MaraBot to quickly send customized messages to specified approved users. Simply supply user object and message.
  #

  def send_user_custom_message(user, message)
    channel = TelegramBot::Channel.new(username: user.friendly_name, id: user.chat_id)
    out_message = TelegramBot::OutMessage.new(chat: channel, text: message)
    @bot.send_message(out_message)
  end
end
