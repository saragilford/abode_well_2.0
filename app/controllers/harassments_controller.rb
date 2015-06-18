class HarassmentsController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @harass = Harassment.new(category: params[:category],comment: params[:comment],building_id: @building.id)
    harass_hash = @harass.attributes
    report_type = {class: "Harassment Report"}


    if @harass.save
      # respond_to do |format|
        render json: harass_hash.merge(report_type).to_json
        # report_type.merge(harass_hash).to_json
      # end
    end
  end

end
