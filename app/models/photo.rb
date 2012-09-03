class Photo < ActiveRecord::Base
	belongs_to :casestudy
	
	attr_accessible :casestudy_id, :description, :ext, :stauts, :path
	mount_uploader :path, CasestudiesUploader
end
