class AddTargetToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :target, :decimal
  end
end
