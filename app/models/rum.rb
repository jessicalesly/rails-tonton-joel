class Rum < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true
  validates :volume, presence: true
  validates :origin, presence: true

  geocoded_by :origin
  after_validation :geocode, if: :will_save_change_to_origin?
  include PgSearch
  pg_search_scope :search_rum,
    against: [ :name, :description ],
    using: {
        tsearch: { prefix: true }
      }
end
