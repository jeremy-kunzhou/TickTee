class AddTargetToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :target, :decimal
  end
end
