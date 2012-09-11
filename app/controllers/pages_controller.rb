# encoding: utf-8
class PagesController < ApplicationController
	def index
		render :layout => "index"
		
	
	end
	
	def show
		
		@pagename = params[ :id ]		
		
		respond_to do | format |
			format.html { render action: @pagename }
		end
		
	end
end
