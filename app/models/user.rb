class User < ActiveRecord::Base
   acts_as_authentic

   has_many :later_links
end
