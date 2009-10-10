class User < ActiveRecord::Base
   acts_as_authentic

   has_many :later_links

   def find_largest_next_unfinished_link_task(time_limit = nil)
    if time_limit
      cond = ['estimated_duration <= ? AND finished = ?', time_limit, false]
    else
      cond = ['finished = ?', false]
    end
    @later_link = self.later_links.find(:last, :order => :estimated_duration,
                                 :conditions => cond)
  end
end
