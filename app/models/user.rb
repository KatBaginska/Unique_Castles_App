class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :castles
  validates :first_name, :last_name, presence: true
  validates :email, :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
