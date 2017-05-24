class RemoveIndustryIdFromProServices < ActiveRecord::Migration[5.0]
  def change
    remove_column :pro_services, :industry_id
  end
end
