class CreateEvictionNotices < ActiveRecord::Migration
  def change
    create_table    :eviction_notices do |t|
      t.belongs_to  :building
      t.belongs_to  :tenant

      t.text        :comment
      t.string      :category
      t.date        :date_vacate

      t.timestamps  null: false
    end
  end
end
