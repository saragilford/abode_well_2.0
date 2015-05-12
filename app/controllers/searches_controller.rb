class SearchesController < ApplicationController


 	def index
    render :"buildings/building_profile"
  end

	def new
    # render :"reports/report"
		# do i need to pass form params here? Can I?
		# "You made it!"

	end

	def create
		@search = Search.new(params[:address], params[:zip_code])
		render json: @search 
	end

def show
    @building = Building.find(params[:id])
    @score = @building.badge_score


    @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

    @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

    @building = Building.where(id: params[:id]).first

    @reports_array = []
    @building.harassments.each do |report|
      @reports_array << report
    end

    @building.fix_orders.each do |report|
      @reports_array << report
    end

    @building.eviction_notices.each do |report|
      @reports_array << report
    end

    @building.rent_notices.each do |report|
      @reports_array << report
    end

  @reports_array.sort!{|a,b|a.updated_at <=> b.updated_at}

  @reports_array = @reports_array.first(10)

    render :"buildings/building_profile"
    # render json:  @building
  end

end
