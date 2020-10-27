class AddIsDecimalUnitToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :is_decimal_unit, :boolean
  end
end
