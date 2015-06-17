class HarassmentsController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @harass = Harassment.new(category: params[:category],comment: params[:comment],building_id: @building.id)
    harass_hash = @harass.to_h
    report_type = {class: "Harassment Report")

    if @harass.save
      respond_to do |format|
        format.json { render json: (report_type + harass_hash).to_json }
        format.html {redirect_to building_path(@building)}
      end
    end
  end

end
