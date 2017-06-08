class Bid < ApplicationRecord

  validates :comment, presence: true
  validates :amount, presence: true

  belongs_to :pro, foreign_key: :user_id
  belongs_to :project
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

  def self.highest_revenue_service
    # user can see the service that has the highest revenue
    # i.e. what service has made the most money
    Project.last
  end

  def self.revenue_per_service #(service)
    # user can see a list of all services with the gross revenue they've generated
    Project.first
  end

end
