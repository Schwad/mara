namespace :mara do
  desc 'initializes mara bot'
  task start: :environment do
    MaraBot.perform_async
  end
end
