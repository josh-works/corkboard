class AddServiceToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :service
  end
end
