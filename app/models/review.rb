class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro

  def self.total_count

  end



end
