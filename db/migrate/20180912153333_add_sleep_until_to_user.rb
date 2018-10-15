class AddSleepUntilToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sleep_until, :datetime, default: DateTime.now
  end
end
