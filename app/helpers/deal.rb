class Deal

  def initialize(west, north, east, south)
    @west = west
    @north = north
    @east = east
    @south = south
  end

  # def cappelletti(a = 17, b = 2 )
  #   @west.weak_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  # end

  def cappelletti(a = 15, b = 7)
    @west.weak_1NT? && @east.less_than?(a) && (@north.at_least54?(min_points: b) || @south.at_least54?(min_points: b))
  end

  # def dont(a = 15, b = 2 )
  #   @west.strong_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  # end

  def dont(a = 15, b = 8)
    @west.strong_1NT? && @east.less_than?(a) && (@north.at_least54?(min_points: b) || @south.at_least54?(min_points: b))
  end

  def multi2d
    @west.multi2d?
  end

  def stayman(a = 7)
    @west._1NT? && @east._4card_major? && !@east.less_than?(a)
  end

  def smolen(a = 7)
    @west._1NT? && @east._4_5in_majors? && !@east.less_than?(a)
  end

  def garbage_stayman(a = 8)
    @west.strong_1NT? && @east._4_5in_majors? && @east.less_than?(a) ||
    @west.weak_1NT? && @east._4_5in_majors? && @east.less_than?(a + 3)
  end

  def weak2_defense
    @west.weak2?
  end

end
