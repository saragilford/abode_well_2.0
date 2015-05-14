class Search < ActiveRecord::Base
	# as defined in code tunes: 
	# http://codetunes.com/2008/07/20/tableless-models-in-rails/
	# class_inheritable_accessor :columns
  # self.columns = []

  # as defined in RailsCast #193:
  # http://railscasts.com/episodes/193-tableless-model


# TURN ON AFTER MODEL VALIDATION

#   def self.columns() @columns \=[];end

# # as defined in both:
#   def self.column(name, sql_type = nil, default = nil, null = true)
#     columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
#   end

#   column :address, :string
#   column :zip_code, :integer

# SEE IF YOU NEED THIS
  # belongs_to :building

  validates_presence_of :address
  validates_presence_of :zip_code
	validates_length_of :zip_code, :minimum => 5
end
