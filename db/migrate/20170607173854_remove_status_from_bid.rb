class RemoveStatusFromBid < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :status, :integer
  end
end
