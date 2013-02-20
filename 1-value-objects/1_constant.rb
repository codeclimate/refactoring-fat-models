class Constant < ActiveRecord::Base
  # ...

  def worse_rating
    if rating_string == "F"
      nil
    else
      rating_string.succ
    end
  end

  def rating_higher_than?(other_rating)
    rating_string > other_rating.rating_string
  end

  def rating_string
    if remediation_cost <= 2
      "A"
    elsif remediation_cost <= 4
      "B"
    elsif remediation_cost <= 8
      "C"
    elsif remediation_cost <= 16
      "D"
    else
      "F"
    end
  end

end
