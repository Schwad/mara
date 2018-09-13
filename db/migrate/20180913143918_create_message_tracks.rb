class CreateMessageTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :message_tracks do |t|
      t.integer :message_id

      t.timestamps
    end
  end
end
