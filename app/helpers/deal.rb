class Deal

  def initialize(west, north, east, south)
    @west = west
    @north = north
    @east = east
    @south = south
  end

  def cappelletti(a = 17, b = 2 )
    @west.weak_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  end

  def dont(a = 15, b = 2 )
    @west.strong_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  end

end
