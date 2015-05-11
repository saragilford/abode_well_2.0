require 'rails_helper'

RSpec.describe BuildingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    xit "requires an address string"
    xit "requires a zip code integer"
    xit "redirects to #search page"
  end

  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
    xit "has recieved address and zip code as params"
    xit "returns a list of all buildings matching that zip code"
    xit "selects only matching address numbers"
    xit "creates an instance variable to hold matching addresses"
    xit "renders a view of all results"
    xit "displays results as links to show pages"
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
