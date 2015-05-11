class EvictionNotice < ActiveRecord::Base
  belongs_to :building
  belongs_to :tenant

def eviction_category_score
    if self.category == "Ellis Act"
      return 5
    elsif self.category == ("Landlord Move-In" || "Condo Coversion")
      return 3
    else
      return 0
    end
  end
  def each_eviction_total
    sum = 0
    self.eviction_notices.all.each do |complaint|
      sum += complaint.eviction_category_score
    end
    return sum
  end

  def num_evict_flags
    if self.eviction_notices.all.length > 1
      return self.eviction_notices.all.length^1.5
    else
      return 0
    end
  end

  def eviction_score
    num_evict_flags + each_eviction_total
  end
end
