class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro


    def self.total_count(pro)
      where(pro_id: pro).count
    end

    def self.total_average(pro)
      service = ProReviewService.new
      service.find_average(pro_id)
    end


end
