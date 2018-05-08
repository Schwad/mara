Sidekiq.configure_server do |config|
  config.redis = { url: Rails.env.production? ? ENV['REDIS_URL'] : 'redis://localhost:6379', size: Rails.env.production? ? 5 : 27 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.env.production? ? ENV['REDIS_URL'] : 'redis://localhost:6379' }
end
