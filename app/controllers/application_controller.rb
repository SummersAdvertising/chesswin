# encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :beforeSetting
  after_filter :afterRestoring
  
  protect_from_forgery
  
  $metaTitle = nil
  $metaTitles = {
  							"pages" => {
	  							"service" => "服務項目",
	  							"contact" => "聯絡我們",
	  							"about" => "關於我們"
  							},
  							"casestudies" => {
	  							"index" => "成功案例"
  							}
  						  }

private
	def beforeSetting
		$metaTitle = $metaTitles[ params[ :controller ] ][ params[ :id ] || params[ :action ] ] if $metaTitle.nil? && !$metaTitles[ params[ :controller ] ].nil?
	end
	
	def afterRestoring
		$metaTitle = nil
		$metaDescription = nil
	end
end
