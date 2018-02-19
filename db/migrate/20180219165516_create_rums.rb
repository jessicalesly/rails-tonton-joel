class CreateRums < ActiveRecord::Migration[5.1]
  def change
    create_table :rums do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.text :anecdote
      t.integer :price
      t.boolean :availability, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
