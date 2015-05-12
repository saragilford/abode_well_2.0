class SearchesController < ApplicationController


 	def index
    render :"buildings/building_profile"
  end

	def new
    # render :"reports/report"
		# do i need to pass form params here? Can I?
		# @search = Search.new(params[:address], params[:zip_code])
		# "You made it!"

	end

	# def create
	# 	# @search = 
	# end


end
