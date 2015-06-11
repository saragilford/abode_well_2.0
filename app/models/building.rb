class Building < ActiveRecord::Base

  belongs_to :property_owner

  has_many  :tenants
  has_many  :ellis_acts

  has_many  :harassments
  has_many  :fix_orders
  has_many  :rent_notices
  has_many  :eviction_notices

  accepts_nested_attributes_for  :harassments
  accepts_nested_attributes_for  :fix_orders
  accepts_nested_attributes_for  :rent_notices
  accepts_nested_attributes_for  :eviction_notices


  #Data Import

  def self.import!
    new.import_pub!
  end

  def import_pub!
    # first_batch -- done
    # second_batch -- done
    # third_batch -- done
    # fourth_batch -- done
    # fifth_batch -- done
    # sixth_batch -- done
  end

  def first_batch
    import_ellis!("Ellis_Act_Withdrawals_1.csv")
  end

  def second_batch
    import_move_in!("Owner_Move_In.csv")
  end

  def third_batch
    import_move_in!("Owner_Move_In_2.csv")
  end

  def fourth_batch
    import_move_in!("Owner_Move_In_3.csv")
  end

  def fifth_batch
    import_move_in!("Owner_Move_In_4.csv")
    import_ellis!("Ellis_Act_Withdrawals_2.csv")
  end

  def sixth_batch
    import_condo!
  end

  def import_ellis!(file)
    CSV.foreach(file, encoding: "iso-8859-1:UTF-8", headers: true, header_converters: :symbol) do |row|
       @building = Building.where(orig_address: row[:address]).first
        next if row[:lat_long] == nil
       if exists?(row[:address])
         p "Changing ELLIS of #{row[:address]}"
         @building.ellis = true
       else
         latitude, longitude = parse_latitude_and_longitude_string(row[:lat_long])
          attributes = {
            address: reverse_geocode(latitude, longitude),
            zip_code: row[:zip_code],
            neighborhood: row[:neighborhood],
            orig_address: row[:address],
            latitude: latitude,
            longitude: longitude,
            ellis: true,
          }
          puts "Creating new building: #{attributes.inspect}"
          Building.create!(attributes)
       end
     end
   end

  def import_move_in!(file)
    CSV.foreach(file, encoding: "iso-8859-1:UTF-8", headers: true, header_converters: :symbol) do |row|
        @building = Building.where(orig_address: row[:address]).first
        next if row[:lat_long] == nil
        if exists?(row[:address])
          p "Changing move in of #{row[:address]}"
          @building.move_in = true
        else
          # p '*' * 80
          # p row.inspect
          # p '*' * 80

          latitude, longitude = parse_latitude_and_longitude_string(row[:lat_long])
          attributes = {
            address: reverse_geocode(latitude, longitude),
            zip_code: row[:zip_code],
            neighborhood: row[:neighborhood],
            latitude: latitude,
            orig_address: row[:address],
            longitude: longitude,
            move_in: true,
          }
          puts "Creating new building: #{attributes.inspect}"
          Building.create!(attributes)
        end
    end
  end

  def import_condo!
    CSV.foreach("Condo_Conv.csv", encoding: "iso-8859-1:UTF-8", headers: true, header_converters: :symbol) do |row|
        @building = Building.where(orig_address: row[:address]).first
          if exists?(row[:address])
          p "Changing condo conv of #{row[:address]}"
          @building.condo_conv = true
        else
          latitude, longitude = parse_latitude_and_longitude_string(row[:lat_long])
          attributes = {
            address: reverse_geocode(latitude, longitude),
            zip_code: row[:zip_code],
            neighborhood: row[:neighborhood],
            latitude: latitude,
            orig_address: row[:address],
            longitude: longitude,
            move_in: true,
          }
          puts "Creating new building: #{attributes.inspect}"
          Building.create!(attributes)
        end
    end
  end

  def reverse_geocode(lat,long)
    sleep(0.5)
    result = Geocoder.search("#{lat}, #{long}").first
    result.address.split(", ").first if result
  end

  def parse_latitude_and_longitude_string(string)
    string.gsub("(","").gsub(")","").split(", ")
  end

  def exists?(address)
    if Building.where(orig_address: address).first
      return true
    end
  end








  # search
  #reduces to numbers exlusively
  def only_numbers
    @address = self.address
    return @address.to_s.gsub(/\D/,"")
  end

  # algorithm
  def badge_score
    subtract_score.to_s.to_i
  end

  private

  def ellis_score
    if self.ellis_acts.all.length >= 1
      return 10
    else
      return 0
    end
  end

  def nofault_score
    if (self.move_in || self.condo_conv)
      return 5
    else
      return 0
    end
  end

  #~~~~~~~~~~~~~~~USER GENERATED~~~~~~~~~~~~~~~~~~~~~~

  #harassment

  def harass_score
    if self.harassments.all.length > 1
      return self.harassments.all.length**0.8
    elsif self.harassments.all.length == 1
      return 1
    else
      return 0
    end
  end


  #Maintenance Issue

  # def additional_unres_days
  #   self.days_unresolved - 7
  # end

  # def unres_days_score
  #   additional_unres_days**0.3
  # end

  # def day_score_calc
  #   if self.days_unresolved > 7
  #     return unres_days_score
  #   elsif self.days_unresolved >= 2
  #     return 1
  #   else
  #     return 0
  #   end
  # end

  def each_fix_total
    sum = 0
    self.fix_orders.all.each do |complaint|
      sum += complaint.day_score_calc
    end
    return sum
  end

  def num_fix_flags
    if self.fix_orders.all.length > 1
      return self.fix_orders.all.length**0.8
    else
      return 0
    end
  end

  def fix_score
    num_fix_flags + each_fix_total
  end

  #eviction complaint
  # def eviction_category_score
  #   if self.category == "Ellis Act"
  #     return 5
  #   elsif self.category == ("Landlord Move-In" || "Condo Coversion")
  #     return 3
  #   else
  #     return 0
  #   end
  # end

  def each_eviction_total
    sum = 0
    self.eviction_notices.all.each do |complaint|
      sum += complaint.eviction_category_score
    end
    return sum
  end

  def num_evict_flags
    if self.eviction_notices.all.length > 1
      return self.eviction_notices.all.length**1.5
    else
      return 0
    end
  end

  def eviction_score
    num_evict_flags + each_eviction_total
  end

  # rent increase

  # def percent_increase
  #   increase = (self.new_rent - self.prior_rent)/self.prior_rent
  #   if increase >= 0.1
  #     return increase
  #   else
  #     return 0
  #   end
  # end

  # def additional_increase
  #   add_inc = (percent_increase - 0.09)/0.05
  #   return (add_inc**0.3)
  # end

  def each_increase_total
    sum = 0
    self.rent_notices.all.each do |complaint|
      sum += (complaint.percent_increase + complaint.additional_increase)
    end
    return sum
  end

  def num_increase_flags
    if self.rent_notices.all.length > 1
      return self.rent_notices.all.length**1.5
    else
      return 0
    end
  end

  def rent_score
    num_increase_flags + each_increase_total
  end

  def user_score
    eviction_score + fix_score + harass_score + rent_score
  end

  def pub_score
    ellis_score + nofault_score
  end

  def weight_pub_score
    pub_score * 4
  end

  def total_score
    user_score + weight_pub_score
  end

  def subtract_score
    100 - total_score
  end

end
