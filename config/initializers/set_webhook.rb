MaraBot.new.core.set_webhook("#{Rails.application.credentials[Rails.env.to_sym][:bot_host]}/webhooks/telegram_#{Rails.application.credentials[Rails.env.to_sym][:webhook_key]}")
puts "Webhook set"
