class AddWeeklySchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :schedule, :integer, :default => 0
  end
end
