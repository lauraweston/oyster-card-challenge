

class Oystercard

  attr_reader :balance, :entry_station, :journeys
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{MAXIMUM_LIMIT}." if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def in_journey?
    !entry_station.nil?
  end

  def touch_in(station)
    fail "Insufficient funds!" if balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    @journeys << {:entry_station => @entry_station, :exit_station => station}
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

private

  def deduct(amount)
    @balance -= amount
  end

end
