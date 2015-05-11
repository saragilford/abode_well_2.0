class BuildingsController < ApplicationController

  def index

    # @buildings = Building.all
    # render json: @buildings
  end

  def new

  end

  def create
    @building = Building.new()

  end

  def show

    # @building=Building.where(address:params[:address])
    @building=Building.first
    @score=@building.badge_score

    render json: [@building, theScoopsScore:@score]
    # render json:  @building
  end


  def edit

  end

  def update

  end

  def destroy

  end

end
