class RemoveGlyphiconFromIndustry < ActiveRecord::Migration[5.0]
  def change
    remove_column :industries, :glyphicon
  end
end
