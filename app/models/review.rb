class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro_user

  def self.total_count

  end



end
