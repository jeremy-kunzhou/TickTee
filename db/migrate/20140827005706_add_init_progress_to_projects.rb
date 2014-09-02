class AddInitProgressToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :init_progress, :decimal
  end
end
