class BuildingsController < ApplicationController

  def index
    render :"buildings/index"
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



end
