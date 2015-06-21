class RentNoticesController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @rent_increase = RentNotice.new(prior_rent: params[:prior_rent], new_rent: params[:new_rent], comment: params[:comment], building_id: @building.id)

    rent_increase_hash = @rent_increase.attributes
    report_type = {class: "Rent Increase"}

    if @rent_increase.save
      render json: rent_increase_hash.merge(report_type).to_json
    end
  end


end
