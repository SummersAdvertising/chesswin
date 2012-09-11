class CasestudiesController < ApplicationController
	def index
		
		@casestudies = Casestudy.order( "created_at desc" ).all
	
		respond_to do | format |
			format.html
		end
	end
	
	def show
		
		@casestudy = Casestudy.find( params[ :id ] )
		@photos = @casestudy.photos.order( "created_at desc" )
		
		respond_to do | format |
			format.html
			format.json { render json: @casestudy }
		end		
	end
end
