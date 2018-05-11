class CreateDataPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :data_points do |t|
      t.references :user, foreign_key: true
      t.text :weather_data
      t.text :full_weather_record

      t.timestamps
    end
  end
end
