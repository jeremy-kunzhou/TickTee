class AddSyncModeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :sync_mode, :string
  end
end
