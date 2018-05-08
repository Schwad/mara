class HardWorker
  include Sidekiq::Worker

  def perform
    puts "*" * 1000
    puts "I AM DOING SOMETHING"
    puts "*" * 1000
    sleep 2
    puts "woops I slept"
  end
end
