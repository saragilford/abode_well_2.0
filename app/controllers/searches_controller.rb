class SearchesController < ApplicationController


 	def index
    render :"buildings/index"
  end

	def new
		# do i need to pass form params here? Can I?
		# @search = Search.new(params[:address], params[:zip_code])
		"You made it!"
	end

	# def create
	# 	# @search = 
	# end


end
