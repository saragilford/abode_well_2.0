class PropertyOwner < ActiveRecord::Base
  has_many  :buildings
  has_many  :ellis_acts

  has_many  :tenants, through: :buildings

  has_many  :harassments, through: :buildings
  has_many  :fix_orders, through: :buildings
  has_many  :rent_notices, through: :buildings
  has_many  :eviction_notices, through: :buildings
end
