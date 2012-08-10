class UsersController < ApplicationController

  def login
  	respond_to do | format |
  		if session[ :user ].nil?
	  		@user = User.new
  			format.html
  		else
  			format.html { redirect_to :controller => :admin }
  		end
  	end
  
  end
  
  def logout
  	
  	session[ :user ] = nil
  	
  	respond_to do | format |
  		format.html { redirect_to root_url + 'login', :notice => "Logout Successfully." }
  	end
  	
  end
  
  # 取得登入授權
  def get_permission
	 
	 @user = params[ :user ]
	 
	 searchUser = User.where( :username => @user['username'], :password => Digest::SHA1.hexdigest( @user['password'] ) ).first
	  
	  respond_to do | format |		  	
		  if searchUser
		  	# 更新使用者登入時間
		  	searchUser[ :last_login ] = DateTime.now
		  	searchUser.save
		  	
		  	session[ :user ] = searchUser
		  	session[ :user ][ :password ] = '**hidden**'
		  	params[ :session ] = session
		  	
		  	if params[ :redirect ].nil?
		  		format.html { redirect_to :controller => :admin }
		  	else
		  		format.html { redirect_to params[ :redirect ] }
		  	end
		  	
		  else
		  	
		  	format.html { redirect_to root_url + 'login', :notice => 'Username not found or wrong password' }
		  	format.json { render json: searchUser, status: :unprocessable_entity }
		  	
		  end
	  end
	  
	  
	  
	  
	  
  end
  
  
end
