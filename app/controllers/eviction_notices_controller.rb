class EvictionNoticesController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @evict = EvictionNotice.new(category: params[:category],comment: params[:comment],building_id: @building.id)

    evict_hash = @evict.attributes
    report_type = {class: "Eviction Notice"}

    p '*' * 80
    p params
    p '&' * 80
    p @building
    p '^' * 80
    p @evict
    p '$' * 80

    if @evict.save
      render json: evict_hash.merge(report_type).to_json
    else
      p "%" * 80
      p "NOT SAVED"
      p "%" * 80
    end

  end

end


