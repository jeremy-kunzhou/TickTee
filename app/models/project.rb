class Project < ActiveRecord::Base
  include ImageGeneration
  include AnyBase
  validates :name, presence: {message: "Name cannot be blank."}
  validates :start_at, :end_at, :expected_progress, :current_progress, presence: true;

  def self.generate_image(project_id, format)
    project = Project.find(project_id)
    url = Rails.root.join('public', 'progress', project.name + '.' + format).to_s
    diff_total = (project.end_at - project.start_at).to_f
    day_left = project.end_at - Time.now.to_date;
    day_left = 0 if day_left < 0
    diff_current = ([Time.now.to_date, project.end_at].min - project.start_at).to_f
    expected_progress = (diff_current / diff_total * 100.0).ceil
    actual_progress = project.current_progress
    diff_progress = [expected_progress - actual_progress, 0].max
    ImageGeneration::generateImage(project.name, day_left.to_i, "orange", actual_progress, diff_progress,url)
  end
end
