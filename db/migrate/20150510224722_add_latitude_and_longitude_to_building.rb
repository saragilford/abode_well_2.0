class AddLatitudeAndLongitudeToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :latitude, :float
    add_column :buildings, :longitude, :float

    remove_column :buildings, :lat_long
  end
end
