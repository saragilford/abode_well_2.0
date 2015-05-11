class RentNotice < ActiveRecord::Base
  belongs_to :building
  belongs_to :tenant

  def percent_increase
    increase = (self.new_rent - self.prior_rent)/self.prior_rent
    if increase >= 0.1
      return increase
    else
      return 0
    end
  end

  def additional_increase
    add_inc = (percent_increase - 0.09)/0.05
    return (add_inc**0.3)
  end
end
