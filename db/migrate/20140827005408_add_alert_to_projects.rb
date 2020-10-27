class AddAlertToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :alert, :string
  end
end
