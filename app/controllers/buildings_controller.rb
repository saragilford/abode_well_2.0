class BuildingsController < ApplicationController

  def index
    render :"buildings/index"
  end

  def search
    @only_zips = []
    @buildings = Building.where(zip_code: params[:zip_code])

    @buildings.each do |building|
      if building.only_numbers == params[:address].gsub(/\D/,"")
        @only_zips << building
      end
    end

    if @only_zips.first != nil
      @this_building = @only_zips.first
      @neighbors = Building.where(neighborhood: @this_building.neighborhood)

      render :results
    else
      session[:address] = params[:address]
      session[:zip_code] = params[:zip_code]
      redirect_to new_building_path

      # (:zip_code => params[:zip_code], :address => params[:address])
    end
  end


  def new

    @report_categories = ["Select...", "LeaseIncrease", "MaintenenceIssue", "EvictionNotice", "OtherHarassment"]

    @letter_options = ["Ellis Act", "Landlord Move-In", "Condo Conversion"]

  end

  def create
    p '*' * 80
    p params
    p '*' * 80
    p session[:address]
    p session[:zip_code]
    result = Geocoder.search(parse_address(session[:address],session[:zip_code])).first
    p "^" * 80
    p result

    if result != nil
      @building = Building.new(
        address: format_address(result),
        zip_code: session[:zip_code],
        latitude: format_lat(result),
        longitude: format_long(result),
        neighborhood: format_neighborhood(result)
        )

      if @building.save
        # @harassment = @building.harassments.build(category: params[:category],comment: params[:harasscomment])

        # @fix_order = @building.fix_orders.build(days_unresolved: params[:days_unresolved],comment: params[:fixcomment], description: [:description])
        p '*' * 80
        p "Building got saved yall!"
        p '*' * 80


        @rent_notice = @building.rent_notices.build(prior_rent: params[:prior_rent], new_rent: params[:new_rent], comment: params[:rentcomment])

        if @rent_notice.save
          p '*' * 80
          p "Rent complaint was saved"
          p '*' * 80
        else
          p '*' * 80
          p "RENT NOT SAVED AT ALL!!!"
          p '*' * 80
        end




        # @eviction_notice = @building.eviction_notices.build(category: params[:eviccategory],comment: params[:eviccomment])


        redirect_to @building

        p "****I've been redirected****"

       else

         render json: @building.errors.to_json
         p '%' * 100
         p @building.errors
         p '%' * 100
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
