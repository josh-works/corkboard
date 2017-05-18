class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :status, default: 0
      t.string :zipcode
      t.boolean :recurring, default: false
      t.string :timeline
      t.text :description

      t.timestamps null: false
    end
  end
end
