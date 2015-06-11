class EvictionNoticesController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @evict = EvictionNotice.new(category: params[:category],comment: params[:comment],building_id: @building.id)

    p '*' * 80
    p params
    p '&' * 80
    p @building
    p '^' * 80
    p @evict
    p '$' * 80
    if @evict.save
      respond_to do |format|
        format.json { render json: @evict.to_json }
        format.html {redirect_to building_path(@building)}
      end
    else
      p "%" * 80
      p "NOT SAVED"
      p "%" * 80
    end

  end

end
