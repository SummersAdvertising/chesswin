class PagesController < ApplicationController
	def index
	
		respond_to do | format |
			format.html 
		end
	
	end
	
	def show
		
		@pagename = params[ :id ]
		
		respond_to do | format |
			format.html { render action: @pagename }
		end
		
	end
end
