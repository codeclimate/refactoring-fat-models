class Constant < ActiveRecord::Base
  # …

  def rating
    @rating ||= Rating.from_cost(cost)
  end
end
