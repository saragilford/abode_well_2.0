require 'rails_helper'

RSpec.describe Building, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"





describe "Make buildings" do 
 before :each do
 	@buildings = Building.all
 end
 
	it "can create a list of all buildings" do
		expect(@buildings).to be_kind_of(Array)
	end
end


end
