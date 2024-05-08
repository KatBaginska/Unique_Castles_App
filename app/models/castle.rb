class Castle < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
