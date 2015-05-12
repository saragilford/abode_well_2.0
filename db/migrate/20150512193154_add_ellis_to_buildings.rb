class AddEllisToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :ellis, :boolean
  end
end
