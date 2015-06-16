class SearchesController < ApplicationController

 	def index
    render :"buildings/index"
    @search = Search.new()
    @errors = @search.errors.full_messages
  end

	def create
		@search = Search.new(address:params[:address], zip_code:params[:zip_code])
		if @search.valid?
      list = results_list(params[:address],params[:zip_code])
      if list.first != nil
        render json: @only_zips.to_json
      else
        session[:address] = params[:address]
        session[:zip_code] = params[:zip_code]
      end
		else
			@errors = @search.errors.full_messages
      render :"buildings/index"
		end

	end

  private

  def results_list(address,zip)
    @only_zips = []
    @buildings = Building.where(zip_code: zip)

    @buildings.each do |building|
      if building.only_numbers == address.gsub(/\D/,"")
        @only_zips << building
      end
    end
    return @only_zips
  end

end
