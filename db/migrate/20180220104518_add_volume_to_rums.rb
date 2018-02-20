class AddVolumeToRums < ActiveRecord::Migration[5.1]
  def change
    add_column :rums, :volume, :string
  end
end
