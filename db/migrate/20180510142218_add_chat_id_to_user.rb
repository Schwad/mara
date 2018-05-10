class AddChatIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :chat_id, :text
  end
end
