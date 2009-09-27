class LaterLink < ActiveRecord::Base
  validates_presence_of :url
  validates_format_of :url, :with => /^(http(s)?|ftp):\/\//
  validates_presence_of :name
  validate :duration_greater_than_zero
  
  def duration_greater_than_zero
    errors.add(:estimated_duration, "Task duration must be greater than 0 minutes") if !(estimated_duration > 0)
  end
end
