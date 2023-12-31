class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tracks

  validates :full_name, presence: true
  validates :display_name, presence: true
  validates :display_name, uniqueness: true
end
