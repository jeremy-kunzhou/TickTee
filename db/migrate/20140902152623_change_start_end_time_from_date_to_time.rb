class ChangeStartEndTimeFromDateToTime < ActiveRecord::Migration
  def up
    change_column :projects, :start_at, :datetime
    change_column :projects, :end_at, :datetime
    
  end
  
  def down
    change_column :projects, :start_at, :date
    change_column :projects, :end_at, :date
    
  end
end
