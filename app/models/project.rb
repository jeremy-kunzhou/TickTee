class Project < ActiveRecord::Base
  include ImageGeneration
  include AnyBase
  validates :name, presence: {message: "Name cannot be blank."}
  validates :start_at, :end_at, :expected_progress, :current_progress, presence: true;
  belongs_to :user
  def generate_image(format)
    url = Rails.root.join('public', 'progress', self.name + '.' + format).to_s
    diff_total = (self.end_at - self.start_at).to_f
    day_left = self.end_at - Time.now.to_date;
    day_left = 0 if day_left < 0
    diff_current = ([Time.now.to_date, self.end_at].min - self.start_at).to_f
    expected_progress = (diff_current / diff_total * 100.0).ceil
    actual_progress = self.current_progress
    diff_progress = [expected_progress - actual_progress, 0].max
    ImageGeneration::generateImage(self.name, day_left.to_i, "orange", actual_progress, diff_progress,url)
  end
end
