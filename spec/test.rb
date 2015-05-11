# class BuildingsController < ApplicationController
# def search (addr)
# 	@addr = addr
#     @only_zips = []
#     @buildings = Building.where(90210)
#       @buildings.each do |building|
#         if building.only_numbers ==addr.gsub(/\s.+/,"")
#           @only_zips << building
#         end
#       end
#     return @only_zips
#   end

# search( "600 Gravel rd")

# end