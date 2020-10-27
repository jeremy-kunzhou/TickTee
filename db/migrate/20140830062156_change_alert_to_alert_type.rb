class ChangeAlertToAlertType < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :alert, :alert_type
  end
end
