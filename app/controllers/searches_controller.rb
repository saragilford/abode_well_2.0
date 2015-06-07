class SearchesController < ApplicationController

 	def index
    "Search#index page"
  end

	def new
    "Search#new page"
	end

	def create
		@search = Search.new(address:params[:address], zip_code:params[:zip_code])

		# validates a saved search instance
		if @search.save
			redirect_to buildings_search_path :address => @search.address, zip_code: @search.zip_code
		else
			render :error
		end

	end

  def show
    render json:  @search
  end

end
