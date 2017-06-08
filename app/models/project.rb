class Project < ApplicationRecord
  validates :zipcode, presence: true
  validates :timeline, presence: true
  validates :description, presence: true
  validates :status, presence: true

  enum status: [:open, :accepted, :invoiced, :completed]
  enum timeline: ['ASAP', 'Within 2 Weeks', 'Within 2 Months', 'Whenever']

  belongs_to :requester, :class_name => 'User'
  belongs_to :service

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

  def self.most_bid_project
    self.find_by_sql("SELECT name, description, project_id, COUNT(project_id) FROM projects
                  JOIN bids on project_id = projects.id
                  JOIN services on service_id = services.id
                  GROUP BY project_id, projects.description, services.name
                  ORDER BY count(project_id) DESC;").first
  end

  def self.most_requested_project
    self.find_by_sql("select name, service_id, COUNT(service_id) from projects
                 join services on service_id = services.id
                 group by service_id, services.name
                 order by count(service_id) desc;").first
  end
end
