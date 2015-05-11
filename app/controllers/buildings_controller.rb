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
  end




end
