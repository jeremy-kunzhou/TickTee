class AddIsDecimalUnitToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_decimal_unit, :boolean
  end
end
