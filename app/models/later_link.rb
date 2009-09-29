class LaterLink < ActiveRecord::Base
  validates_presence_of :url
  validates_format_of :url, :with => /^(http(s)?|ftp):\/\//
  validates_presence_of :name
  validates_presence_of :estimated_duration
  validate :duration_greater_than_zero
  
  def duration_greater_than_zero
    if !(self.estimated_duration && self.estimated_duration > 0)
      errors.add(:estimated_duration, "Task duration must be greater than 0 minutes")
    end
  end

  def self.find_largest_next_unfinished(time_limit = nil)
    if time_limit
      cond = ['estimated_duration <= ? AND finished = ?', time_limit, false]
    else
      cond = ['finished = ?', false]
    end
    @later_link = LaterLink.find(:last, :order => :estimated_duration,
                                 :conditions => cond)
  end
end