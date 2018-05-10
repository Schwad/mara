namespace :mara do
  desc 'initializes mara bot'
  task start: :environment do
    MaraBot.perform_async
  end

  desc 'destroys all Sidekiq processes'
  task kill: :environment do
    Sidekiq.redis { |conn| conn.flushdb }
  end

  desc 'kills and resets mara, needed for updating bot'
  task reset: :environment do
    system('rake mara:kill')
    system('rake mara:start')
    puts 'MaraBot reset!'
  end
end
