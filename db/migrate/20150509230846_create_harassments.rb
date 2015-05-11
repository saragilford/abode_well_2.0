class CreateHarassments < ActiveRecord::Migration
  def change
    create_table 		:harassments do |t|
      t.belongs_to 	:building
      t.belongs_to 	:tenant

      t.text 				:comment
      t.string 			:category

      t.timestamps 	null: false
    end
  end
end
