class AddServicesIdtoProServices < ActiveRecord::Migration[5.0]
  def change
      add_column :pro_services, :service_ids, :integer, array: true
  end
end
