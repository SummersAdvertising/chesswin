class Casestudy < ActiveRecord::Base
	has_many :photos
	attr_accessible :active_time, :active_time_end, :category, :client, :content, :invitation, :photos, :place, :subtitle, :title
end