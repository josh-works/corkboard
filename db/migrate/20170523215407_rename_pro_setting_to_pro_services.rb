class RenameProSettingToProServices < ActiveRecord::Migration[5.0]
  def change
    rename_table :pro_settings, :pro_services
  end
end
