class Rum < ApplicationRecord
  belongs_to :user
  has_many :orders
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :price, presence: true
  validates :volume, presence: true
end
