# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Building.delete_all
# EllisAct.delete_all
# Harassment.delete_all
# FixOrder.delete_all
# RentNotice.delete_all
# EvictionNotice.delete_all

Building.import!
