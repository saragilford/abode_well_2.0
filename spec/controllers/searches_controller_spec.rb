require 'rails_helper'

RSpec.describe SearchesController, type: :controller do

  # before :each do
  #   @building = Building.first
  # end

  describe "POST #create" do
    it "returns http success" do
      get "searches"
      expect(response).to have_http_status(:success)
    end
    it "redirects to the search index page " do
      get "searches"
      expect(response).to redirect_to("searches")
    end

    xit "creates a new instance of Search"
  end

end