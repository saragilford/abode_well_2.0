class BuildingsController < ApplicationController

  def index
  end

  def search
    @only_zips = []
    @buildings = Building.where(zip_code: params[:zip_code])
      @buildings.each do |building|
        if building.address.only_numbers == params[:address].only_numbers
          @only_zips << building
        end
      end
    return @only_zips
  end

  def new

  end

  def create
    @building = Building.new()

  end

  def show
    @building=Building.find(params[:id])
    @score=@building.badge_score
  # had a merge conflict here:  does it still work?

    @report_categories = ["RentIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]
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
