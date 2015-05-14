class FixOrdersController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @maint_issue = FixOrder.new(days_unresolved: params[:days_unresolved],comment: params[:comment], description: [:description], building_id: @building.id)
    if @maint_issue.save
      respond_to do |format|
        format.json { render json: @maint_issue.to_json }
        format.html {redirect_to building_path(@building)}
      end
    end
  end


end
