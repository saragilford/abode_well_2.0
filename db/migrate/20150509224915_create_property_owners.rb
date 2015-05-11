class CreatePropertyOwners < ActiveRecord::Migration
  def change
    create_table 		:property_owners do |t|
      t.string 			:name

      t.timestamps 	null: false
    end
  end
end
