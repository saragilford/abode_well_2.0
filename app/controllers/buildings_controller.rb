class BuildingsController < ApplicationController

  def new

    @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

    @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

    session[:address] = params[:address]
    session[:zip_code] = params[:zipcode]

  end

  def create
    result = Geocoder.search(parse_address(session[:address],session[:zip_code])).first

    if result != nil
      @building = Building.new(
        address: format_address(result),
        zip_code: session[:zip_code],
        latitude: format_lat(result),
        longitude: format_long(result),
        neighborhood: format_neighborhood(result)
        )

      if @building.save

        @harassment = @building.harassments.build(category: params[:category],comment: params[:harasscomment])

        @fix_order = @building.fix_orders.build(days_unresolved: params[:days_unresolved],comment: params[:fixcomment], description: [:description])

        @rent_notice = @building.rent_notices.build(prior_rent: params[:prior_rent], new_rent: params[:new_rent], comment: params[:rentcomment])

        @eviction_notice = @building.eviction_notices.build(category: params[:eviccategory],comment: params[:eviccomment])

        if params[:harasscomment] != nil
          @harassment.save
        elsif params[:rentcomment] != nil
          @rent_notice.save
        elsif params[:fixcomment] != nil
          @fix_order.save
        elsif params[:eviccomment] != nil
          @eviction_notice.save
        end



        redirect_to @building

       else
         render json: @building.errors.to_json
       end
     end

  end

  def show

    @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

    @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

    @building = Building.where(id: params[:id]).first

#begin variables to send info to the map
    @latitude = @building.latitude
    @longitude = @building.longitude
    @address = @building.address
    @neighborhood = @building.neighborhood
# end variables to send info to the map

    @reports_array = []
    @building.harassments.each do |report|
      @reports_array << report
    end

    @building.fix_orders.each do |report|
      @reports_array << report
    end

    @building.eviction_notices.each do |report|
      @reports_array << report
    end

    @building.rent_notices.each do |report|
      @reports_array << report
    end

    @reports_array.sort!{|a,b|b.updated_at <=> a.updated_at}

    @reports_array = @reports_array.first(10)

    render :"buildings/building_profile"
    # render json:  @search
    end

    def score
      @building = Building.find(params[:id])
      response = {:score => @building.badge_score}
      render json: response.to_json

    end

    def complaint_count
      @building = Building.find(params[:id])
      response = {:harass => @building.harassments.count, :fix_order => @building.fix_orders.count, :evic => @building.eviction_notices.count, :rent => @building.rent_notices.count}
      render json: response.to_json
    end

    private

    def parse_address(address,zip_code)
      address + ", " + zip_code.to_s
    end

    def format_address(data)
      data.address_components[0]["long_name"] + " " + data.address_components[1]["long_name"]
    end

    def format_lat(data)
      data.geometry["location"]["lat"]
    end

    def format_long(data)
      data.geometry["location"]["lng"]
    end

    def format_neighborhood(data)
      data.address_components[2]["long_name"]
    end

end
