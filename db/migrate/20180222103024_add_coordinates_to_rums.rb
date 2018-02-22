class AddCoordinatesToRums < ActiveRecord::Migration[5.1]
  def change
    add_column :rums, :latitude, :float
    add_column :rums, :longitude, :float
  end
end
