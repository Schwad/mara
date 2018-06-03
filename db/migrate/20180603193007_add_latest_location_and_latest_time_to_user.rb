class AddLatestLocationAndLatestTimeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :string
    add_column :users, :location_updated_at, :datetime, default: 10.years.ago
  end
end
