class AddUpdatedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :is_updated, :boolean
  end
end
