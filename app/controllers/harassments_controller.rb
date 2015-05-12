class HarassmentsController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @harass = Harassment.new(category: params[:category],comment: params[:comment],building_id: @building.id)
    if @harass.save
      respond_to do |format|
        format.json { render json: @harass.to_json }
        format.html {redirect_to building_path}
      end
    end
  end

end
