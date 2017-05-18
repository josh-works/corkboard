class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true

  has_many :user_roles
  has_many :roles, through: :user_roles
end
