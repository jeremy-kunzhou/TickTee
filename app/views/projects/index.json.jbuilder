json.array!(current_user.projects) do |project|
  json.extract! project, :id, :name, :description, :start_at, :end_at, :init_progress, :expected_progress, :current_progress, :created_at, :updated_at, :generate_at, :is_updated, :user_id, :target, :unit, :alert_type, :is_decimal_unit, :type, :is_consumed, :sync_mode :schedule
  json.url project_url(project, format: :json)
end
