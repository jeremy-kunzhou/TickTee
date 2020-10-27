class AddUnitToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :unit, :string
  end
end
