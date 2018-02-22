class AddContentToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :content, :string
    add_column :reviews, :rating, :integer
    add_reference :reviews, :rum, foreign_key: true
  end
end
