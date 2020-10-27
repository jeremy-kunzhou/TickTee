class AddIsConsumedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :is_consumed, :boolean
  end
end
