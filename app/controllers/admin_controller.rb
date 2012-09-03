class AdminController < ApplicationController
	before_filter :permission
	layout 'admin'
	
	def permission
		# 驗證使用者登入狀況	
		
		if session[ :user ].nil?			
			session[ :redirect ] = request.url
			
			# 如果沒有登入就導向到登入頁面
			respond_to do | format |
				format.html { redirect_to root_url + 'login', :notice => 'You have to login and continue your operation.' }
			end
		end
	end
		
	def index
		
		respond_to do | format |
			format.html { redirect_to :controller => 'admin/users' }
		end
	
	end
	
end

