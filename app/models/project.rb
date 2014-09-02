class Project < ActiveRecord::Base
  include ImageGeneration
  include AnyBase
  validates :name, presence: {message: "Name cannot be blank."}
  validates :init_progress, :target, :unit, :alert_type, :current_progress, presence: true;
  belongs_to :user
  def generate_image(format)
    self.generate_at = Time.now.to_date
    self.is_updated = false;
    self.save
    url = Rails.root.join('public', 'progress', self.name + '.' + format).to_s  
    if self.end_at == nil || self.end_at.to_s.blank?
      actual_progress = getPercentage(self.current_progress, self.target)
      ImageGeneration::generateImage(self.name, nil, "orange", actual_progress, nil,url)
    else
      diff_total = (self.end_at - self.start_at).to_f
      day_left = self.end_at - Time.now;
      day_left = 0 if day_left < 0
      diff_current = ([Time.now, self.end_at].min - self.start_at).to_f
      expected_progress = (diff_current / diff_total * 100.0).ceil
      actual_progress = getPercentage(self.current_progress, self.target)
      diff_progress = [expected_progress - actual_progress, 0].max
      ImageGeneration::generateImage(self.name, (day_left/24/60/60).to_i, "orange", actual_progress, diff_progress,url)
    end     
  end
  
  def cal_expected_progress
    expected_progress = 0
    if self.end_at
      diff_total = (self.end_at - self.start_at).to_f
      day_left = self.end_at - Time.now;
      day_left = 0 if day_left < 0
      diff_current = ([Time.now, self.end_at].min - self.start_at).to_f
      expected_progress = (diff_current / diff_total * 100.0).ceil
    end
    expected_progress
  end
  
  private 
  def getPercentage(real, total)
    percentage = (real / total).ceil
    percentage = percentage > 100 ? 100 : percentage
    percentage
  end
end
