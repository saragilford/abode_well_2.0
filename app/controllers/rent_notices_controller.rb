class RentNoticesController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @rent_increase = RentNotice.new(prior_rent: params[:prior_rent], new_rent: params[:new_rent], comment: params[:comment], building_id: @building.id)
    if @rent_increase.save
      respond_to do |format|
        format.json { render json: @rent_increase.to_json }
        format.html {redirect_to building_path(@building)}
      end
    end
  end


end
