class AddRequesterToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :requester
  end
end
