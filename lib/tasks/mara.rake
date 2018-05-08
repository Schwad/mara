namespace :mara do
  desc 'initializes mara bot'
  task start: :environment do
    MaraBot.perform_async
  end

  desc 'destroys all Sidekiq processes'
  task kill: :environment do
    Sidekiq.redis { |conn| conn.flushdb }
  end
end
