class AddOriginToRums < ActiveRecord::Migration[5.1]
  def change
    add_column :rums, :origin, :string
  end
end
