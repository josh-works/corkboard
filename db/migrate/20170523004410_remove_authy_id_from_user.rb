class RemoveAuthyIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :authy_id, :string
  end
end
