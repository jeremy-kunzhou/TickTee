class AddInitProgressToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :init_progress, :decimal
  end
end
