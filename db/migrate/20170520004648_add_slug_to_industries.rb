class AddSlugToIndustries < ActiveRecord::Migration[5.0]
  def change
    add_column :industries, :slug, :string
  end
end
