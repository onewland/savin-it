class LaterLink < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :url
  validates_format_of :url, :with => /^(http(s)?|ftp):\/\//
  validates_presence_of :name
  validates_presence_of :estimated_duration
  validates_numericality_of :estimated_duration, :greater_than => 0

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