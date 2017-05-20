class AddGlyphiconToIndustries < ActiveRecord::Migration[5.0]
  def change
    add_column :industries, :glyphicon, :string
  end
end
