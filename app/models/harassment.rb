class Harassment < ActiveRecord::Base
  belongs_to :building
  belongs_to :tenant
end
