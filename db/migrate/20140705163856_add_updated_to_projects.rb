class AddUpdatedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_updated, :boolean
  end
end
