class Castle < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
 
  validates :title, :price, :location, presence: true
  validates :description, length: { minimum: 6 }
end
