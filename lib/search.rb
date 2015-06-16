module Search
  def validate(address,zip_code)
    @search = Search.new(address: address, zip_code: zip_code)

    # validates a saved search instance
    if @search.save
      redirect_to buildings_search_path :address => @search.address, zip_code: @search.zip_code
    else
      @errors = @search.errors.full_messages
      render :"buildings/index"
    end
  end
end