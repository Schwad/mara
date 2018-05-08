class AddFriendlyNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friendly_name, :string
  end
end
