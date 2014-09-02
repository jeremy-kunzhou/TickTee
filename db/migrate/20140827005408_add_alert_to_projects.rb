class AddAlertToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :alert, :string
  end
end
