namespace :scheduled do
  task petition_users_for_data: :environment do
    # Currently randomly samples every four hours during daylight hours.

    if (1..4).to_a.sample == 4 && Time.now.hour > 8 && Time.now.hour < 20
      User.all.each do |user|
        MaraBot.new.ping_user user unless user.reached_data_limit
      end
    end
  end

  task forced_ping_users: :environment do
    User.all.each do |user|
      MaraBot.new.ping_user user
    end
  end
end
