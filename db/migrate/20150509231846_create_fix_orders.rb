class CreateFixOrders < ActiveRecord::Migration
    def change
    create_table    :fix_orders do |t|
      t.belongs_to :building
      t.belongs_to :tenant

      t.text        :comment
      t.integer     :days_unresolved
      t.text      :description

      t.timestamps null: false
    end
  end
end
