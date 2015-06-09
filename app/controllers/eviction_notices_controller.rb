class EvictionNoticesController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first ||
    @evict = EvictionNotice.new(category: params[:category],comment: params[:comment],building_id: @building.id)
    if @evict.save
      respond_to do |format|
        format.json { render json: @evict.to_json }
        format.html {redirect_to building_path(@building)}
      end
    end

  end

end
