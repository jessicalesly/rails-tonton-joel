class ChangeDataTypeForQuantity < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
