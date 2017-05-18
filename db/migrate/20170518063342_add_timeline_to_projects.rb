class AddTimelineToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :timeline, :integer, default: 0
  end
end
