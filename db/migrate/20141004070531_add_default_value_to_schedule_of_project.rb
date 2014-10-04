class AddDefaultValueToScheduleOfProject < ActiveRecord::Migration
  def change
      change_column :projects, :schedule, :integer, :default => 0
  end
end
