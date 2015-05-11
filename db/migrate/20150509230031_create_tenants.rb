class CreateTenants < ActiveRecord::Migration
  def change
    create_table 		:tenants do |t|
      t.belongs_to 	:building

      t.string 			:name
      t.string 			:user_name

      t.timestamps 	null: false
    end
  end
end
