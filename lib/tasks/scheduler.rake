namespace :scheduled do
  task ping_users: :environment do
    # Currently randomly samples every four hours during daylight hours.
    (1..4).to_a.sample == 10 && Time.now.hour > 8 && Time.now.hour < 22
      User.all.each do |user|
        MaraBot.new.ping_user user
      end
    end
  end

  task forced_ping_users: :environment do
    User.all.each do |user|
      MaraBot.new.ping_user user
    end
  end
end
