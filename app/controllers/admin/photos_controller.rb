# encoding: UTF-8
class Admin::PhotosController < AdminController
	before_filter :get_casestudy
	layout "simple"

	def index
		@photos = @casestudy.photos.all( :order => "updated_at DESC" )
		@photo = Photo.new
		respond_to do | format |
			format.html
			format.json { render json: @photos }
		end
	end
	
	def new
		
		@photo = Photo.new
		
		respond_to do | format |
			format.html
		end
		
	end
	
	def show
		@photo = Photo.find( params[ :id ] )
		
		respond_to do | format |
			format.html
			format.json { render json: @photo }
		end
	end
	
	def create
		
		@photo = @casestudy.photos.build( params[ :photo ] )
		respond_to do | format |
		
			if @photo.save && @photo.path.length != 0
				
				# 將id塞回檔名
				@photo.update_attribute('path', "#{@photo.id}#{@photo.path}")		
				
				format.html { redirect_to admin_casestudy_photos_path(@casestudy), :notice => "圖片建立完成" }
				format.json { render json: @photo, status: :created, location => @photo }	
							
			else
				
				@errors = ''
				@photo.destroy
				
				if @photo.path.length == 0 then @errors += "檔案格式錯誤" end
				
				format.html { render action: "new", :notice => '圖片上傳失敗' }
				format.json { render json: params, status: :unprocessable_entity }
				
			end
			 
		end			
	end
	
	def destroy
		@photo = Photo.find( params[ :id ] )
		@photo.destroy
		
		respond_to do | format |
			format.html { redirect_to admin_casestudy_path(@casestudy) , :notice => '圖片刪除完成'}
			format.json { head :no_content }
		end
	end

private
	def get_casestudy
		@casestudy = Casestudy.find( params[ :casestudy_id ] )
	end

end