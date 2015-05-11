class CreateBuildings < ActiveRecord::Migration
  def change
    create_table    :buildings do |t|
      t.belongs_to  :property_owner

      t.string      :address
      t.string      :neighborhood
      t.integer     :zip_code
      t.string      :lat_long
      t.boolean     :move_in
      t.boolean     :condo_conv

      t.timestamps  null: false
    end
  end
end
