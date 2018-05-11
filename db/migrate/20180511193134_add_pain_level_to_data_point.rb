class AddPainLevelToDataPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :data_points, :pain_level, :float
  end
end
