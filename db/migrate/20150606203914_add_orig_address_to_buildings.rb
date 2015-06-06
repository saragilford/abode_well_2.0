class AddOrigAddressToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :orig_address, :string
  end
end
