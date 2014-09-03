class AddSyncModeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :sync_mode, :string
  end
end
