class BuildingsController < ApplicationController

  def index
    render :"buildings/index"
  end

  def search
    @only_zips = []
    @buildings = Building.where(zip_code: params[:zip_code])

    @buildings.each do |building|
      if building.only_numbers == params[:address].gsub(/\D/,"")
        @only_zips << building
      end
    end

    if @only_zips.first != nil
      @this_building = @only_zips.first
      @neighbors = Building.where(neighborhood: @this_building.neighborhood)

      render :results
    else
      redirect_to new_building_path(:zip_code => params[:zip_code], :address => params[:address])
    end
  end


  def new

  end

  def create
    result = Geocoder.search(parse_address(params[:address],params[:zip_code])).first

    @building = Building.create(
      address: params[:address],
      zip_code: params[:zip_code],
      latitude: result.geometry["location"]["lat"],
      longitude: result.geometry["location"]["lng"],
      neighborhood: result.address_components[2]["long_name"]
      )


  end

  def show
    # @building = Building.find(params[:id])
    # @score = @building.badge_score


    @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

    @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

    @building = Building.where(id: params[:id]).first

#begin variables to send info to the map
    @latitude = @building.latitude
    @longitude = @building.longitude
    @address = @building.address
    @neighborhood = @building.neighborhood
# end variables to send info to the map

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

    @reports_array.sort!{|a,b|b.updated_at <=> a.updated_at}

    @reports_array = @reports_array.first(10)

    render :"buildings/building_profile"
    # render json:  @search
    end

    def score
      @building = Building.find(params[:id])
      response = {:score => @building.badge_score}
      render json: response.to_json

    end

end
