class AddTypeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :type, :integer
  end
end
