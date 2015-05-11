class FixOrder < ActiveRecord::Base
  belongs_to :building
  belongs_to :tenant

   def day_score_calc
    if self.days_unresolved > 7
      return unres_days_score
    elsif self.days_unresolved >= 2
      return 1
    else
      return 0
    end
  end

  def additional_unres_days
    self.days_unresolved - 7
  end

  def unres_days_score
    additional_unres_days**0.3
  end
end
