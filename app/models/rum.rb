class Rum < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, presence: true
  validates :price, presence: true
  validates :volume, presence: true
end
