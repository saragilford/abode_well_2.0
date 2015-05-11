class Tenant < ActiveRecord::Base
  belongs_to :building

  has_many  :harassments
  has_many  :fix_orders
  has_many  :rent_notices
  has_many  :eviction_notices
end
