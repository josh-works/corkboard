class AddServiceIdToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :service, index: true
  end
end
