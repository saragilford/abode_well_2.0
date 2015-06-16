class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  attr_accessor :address, :zip_code

  validates_presence_of :address
  validates_presence_of :zip_code
	validates_length_of :zip_code, :minimum => 5

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
