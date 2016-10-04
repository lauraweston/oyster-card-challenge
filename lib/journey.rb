class Journey
  attr_reader :start, :finish
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def start_journey(station)
    @start = station
  end

  def finish_journey(station)
    @finish = station
  end

  def fare
    return MINIMUM_FARE if complete?
    return PENALTY_FARE if !complete?
  end

def complete?
  raise ("no journey recorded") if start.nil? && finish.nil?
  start != nil && finish != nil
end

end
