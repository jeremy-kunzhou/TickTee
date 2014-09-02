class ChangeAlertToAlertType < ActiveRecord::Migration
  def change
    rename_column :projects, :alert, :alert_type
  end
end
