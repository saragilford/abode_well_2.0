class BuildingsController < ApplicationController

  def index
    render :"buildings/index"
  end

  def search
    @only_zips = []
    @buildings = Building.where(zip_code: params[:zip_code])
      @buildings.each do |building|
        # if building.only_numbers == params[:address].gsub(/\s.+/,"")
          @only_zips << building
        # end
      end
      # had a merge conflict here:  render results ok?
    render :results
  end

  def new

  end

  def create
    @building = Building.new()

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

  @reports_array.sort!{|a,b|a.updated_at <=> b.updated_at}

  @reports_array = @reports_array.first(10)

    render :"buildings/building_profile"
    # render json:  @search
    end

end
