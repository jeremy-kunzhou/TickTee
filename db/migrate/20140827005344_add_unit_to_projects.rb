class AddUnitToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :unit, :string
  end
end
