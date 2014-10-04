class AddWeeklySchedule < ActiveRecord::Migration
  def change
    add_column :projects, :schedule, :integer
  end
end
