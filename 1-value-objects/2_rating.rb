class Rating
  include Comparable

  def self.from_cost(cost)
    if    cost <= 2  then new("A")
    elsif cost <= 4  then new("B")
    elsif cost <= 8  then new("C")
    elsif cost <= 16 then new("D")
    else new("F")
    end
  end

  def initialize(letter)
    @letter = letter
  end

  def to_s
    @letter.to_s
  end

  def <=>(other)
    other.to_s <=> to_s
  end

  def worse
    return nil if @letter == "F"
    self.class.new(@letter.succ)
  end

  def higher_than?(other)
    self > other
  end

  def hash
    @letter.hash
  end

  def eql?(other)
    to_s == other.to_s
  end
end
