class AddIsConsumedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_consumed, :boolean
  end
end
