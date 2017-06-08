# require './services/pro_review_service'

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pro

    def self.total_count(pro)
      where(pro_id: pro).count
    end

    def self.total_average(pro)
      where(pro_id: pro).average(:rating).to_i
    end
end
