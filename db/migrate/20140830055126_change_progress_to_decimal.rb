class ChangeProgressToDecimal < ActiveRecord::Migration[6.0]
  def up
    change_column :projects, :expected_progress, :decimal
    change_column :projects, :current_progress, :decimal
    
  end
  
  def down
    change_column :projects, :expected_progress, :integer
    change_column :projects, :current_progress, :integer
    
  end
end
