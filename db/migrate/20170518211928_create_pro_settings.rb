class CreateProSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :pro_settings do |t|
      t.references :industry, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
