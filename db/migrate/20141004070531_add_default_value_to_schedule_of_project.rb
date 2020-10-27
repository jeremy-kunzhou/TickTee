class AddDefaultValueToScheduleOfProject < ActiveRecord::Migration[6.0]
  def change
      change_column :projects, :schedule, :integer, :default => 0
  end
end
