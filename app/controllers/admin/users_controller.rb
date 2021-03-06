class Admin::UsersController < AdminController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit  	
    @user = User.find(params[:id])
  	render :layout => "admin_narrow"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.password = encrypt_password(@user.password)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render json: [:admin, @user], status: :created, location: @user }
      else
      	@users = User.all
      	
        format.html { render action: "index" }
        format.json { render json: [:admin, @user].errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    params[:user]['password'] = encrypt_password(params[:user]['password'] )
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: [:admin, @user].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      respond_to do |format|
	  	if User.all.length <= 1 
	  	
		    format.html { redirect_to admin_users_url, :notice => 'You cannot kill all user.' }
		    format.json { head :no_content }
	  	else 			  	
		    @user = User.find(params[:id])
		    @user.destroy
		    
		    format.html { redirect_to admin_users_url }
		    format.json { head :no_content }
	  	end
    end
  end
  
private
	def encrypt_password( password )
		if password.length() <= 0 then return false end
		 
		return Digest::SHA1.hexdigest( password )
		 
	end
  
end
