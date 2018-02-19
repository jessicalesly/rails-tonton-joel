class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :quantity
      t.string :status, default: "en attente"
      t.references :rum, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
