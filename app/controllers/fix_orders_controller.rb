class FixOrdersController < ApplicationController

  def create
    @building = Building.where(id: params[:building_id]).first
    @maint_issue = FixOrder.new(days_unresolved: params[:days_unresolved],comment: params[:comment], description: [:description], building_id: @building.id)

      maint_issue_hash = @maint_issue.attributes
      report_type = {class: "Maintenance Issue"}

    if @maint_issue.save
      render json: maint_issue_hash.merge(report_type).to_json
    end
  end


end
