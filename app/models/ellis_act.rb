class EllisAct < ActiveRecord::Base
  belongs_to :building
  belongs_to :property_owner
end
