json.array!(current_user.projects) do |project|
  json.extract! project, :id, :name, :description, :start_at, :end_at, :expected_progress, :current_progress
  json.url project_url(project, format: :json)
end
