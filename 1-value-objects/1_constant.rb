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
    if    remediation_cost <= 2  then "A"
    elsif remediation_cost <= 4  then "B"
    elsif remediation_cost <= 8  then "C"
    elsif remediation_cost <= 16 then "D"
    else "F"
    end
  end
end
