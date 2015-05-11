class CreateRentNotices < ActiveRecord::Migration
  def change
    create_table    :rent_notices do |t|
      t.belongs_to  :building
      t.belongs_to  :tenant

      t.text        :comment
      t.integer     :prior_rent
      t.integer     :new_rent

      t.timestamps  null: false
    end
  end
end
