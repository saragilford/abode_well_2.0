class CreateEllisActs < ActiveRecord::Migration
  def change
    create_table :ellis_acts do |t|
      t.belongs_to :building
      t.belongs_to :property_owner
      t.string :filing_number

      t.timestamps null: false
    end
  end
end
