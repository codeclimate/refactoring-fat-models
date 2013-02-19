class Constant < ActiveRecord::Base

  def better_than?(other)
    rating > other.rating
  end

  def rating
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
