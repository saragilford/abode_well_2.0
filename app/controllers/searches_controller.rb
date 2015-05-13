class SearchesController < ApplicationController


 	def index
    # render :"buildings/building_profile"
    
  end

	def new
    # render :"reports/report"
		# do i need to pass form params here? Can I?
		# "You made it!"
	end

	def create
		@search = Search.new(address:params[:address], zip_code:params[:zip_code])

	# holding pen for results array
	# 	@buildings_matching_zips = []
	# # generate a collection of matching buildings
 #    @buildings = Building.where(zip_code: @search.zip_code)
 #      @buildings.each do |building|
 #        if building.only_numbers == @search.address.gsub(/\s.+/,"")
 #          @buildings_matching_zips << building
 #        end
 #      end
 #    # return @buildings_matching_zips

		# validates a saved search instance
		# if @search.save
			# render json: @search 

			redirect_to buildings_search_path :buildings => "try more shit"
			# @buildings_matching_zips
		# else
		# 	render :error
		# end

	end

def show
  #   @building = Building.find(params[:id])
  #   @score = @building.badge_score

  #   @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

  #   @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

  #   @building = Building.where(id: params[:id]).first

  #   @reports_array = []
  #   @building.harassments.each do |report|
  #     @reports_array << report
  #   end

  #   @building.fix_orders.each do |report|
  #     @reports_array << report
  #   end

  #   @building.eviction_notices.each do |report|
  #     @reports_array << report
  #   end

  #   @building.rent_notices.each do |report|
  #     @reports_array << report
  #   end

  # @reports_array.sort!{|a,b|a.updated_at <=> b.updated_at}

  # @reports_array = @reports_array.first(10)

  #   render :"buildings/building_profile"
    render json:  @search
  end

end
