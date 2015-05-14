# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'csv'

Building.delete_all
EllisAct.delete_all
Harassment.delete_all
FixOrder.delete_all
RentNotice.delete_all
EvictionNotice.delete_all

25.times do

# create a building...
  @building = Building.new( address:Faker::Address.street_address,
                            zip_code:[90210,10011,94107,94121].sample,
                            latitude:Faker::Address.latitude,
                            longitude:Faker::Address.longitude,
                            neighborhood:["Outer Mission"].sample,
                            move_in:[true,false].sample,
                            condo_conv:[true,false].sample
                            )
# ...then build the othe objects from this building

  # @tenant = @building.tenants.build(name:Faker::Name.name,
  #                           user_name:Faker::Lorem.word,
  #                           tenant_id:@tenant
  #                           )

  @ellis  = @building.ellis_acts.build(filing_number:Faker::Code.ean,
                            # tenant_id:@tenant
                            )

  @harass = @building.harassments.build(category:Faker::Lorem.words(4),
                            comment:Faker::Lorem.paragraph,
                            # tenant_id:@tenant
                            )

  @fix    =@building.fix_orders.build(days_unresolved:Faker::Number.number(2),
                            description:Faker::Lorem.sentence,
                            comment:Faker::Lorem.paragraph,
                            # tenant_id:@tenant
                            )

  @rent   =@building.rent_notices.build(prior_rent:Faker::Number.number(4),
                            new_rent:Faker::Number.number(4),
                            comment:Faker::Lorem.paragraph,
                            # tenant_id:@tenant
                            )
  @evict  =@building.eviction_notices.build(category:Faker::Lorem.word,
                            comment:Faker::Lorem.paragraph,
                            # tenant_id:@tenant
                            )
# ...using the #build method

  @building.save
  # @tenant.save
  @ellis.save
  @harass.save
  @fix.save
  @rent.save
  @evict.save

end

  Building.import!
