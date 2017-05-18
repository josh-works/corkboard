class Project < ApplicationRecord
  validates :zipcode, presence: true
  validates :timeline, presence: true
  validates :description, presence: true
  validates :status, presence: true
end