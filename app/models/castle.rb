class Castle < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, :price, :location, presence: true
  validates :description, length: { minimum: 6 }

  geocoded_by :location
  after_validation :geocode
end
