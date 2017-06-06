class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro
  #
  # validates :body, :rating

  def self.total_count(pro)
    where(pro_id: pro).count
  end

end
