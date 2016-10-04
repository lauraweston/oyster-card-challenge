class Journey
  attr_reader :start, :end

  def initialize(start)
    @start = start
  end

  def finish(station)
    @end = station
  end


end
