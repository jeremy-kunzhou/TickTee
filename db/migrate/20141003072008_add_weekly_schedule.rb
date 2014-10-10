class AddWeeklySchedule < ActiveRecord::Migration
  def change
    add_column :projects, :schedule, :integer, :default => 0
  end
end
