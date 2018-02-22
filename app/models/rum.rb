class Rum < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, presence: true
  validates :price, presence: true
  validates :volume, presence: true

  include PgSearch
  pg_search_scope :search_rum,
    against: [ :name, :description ],
    using: {
        tsearch: { prefix: true }
      }
end
