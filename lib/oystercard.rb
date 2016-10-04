require_relative 'journey'
class Oystercard

  attr_reader :balance, :entry_station, :journeys
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Balance cannot exceed £#{MAXIMUM_LIMIT}." if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def in_journey?
    journey.start != nil
  end

  def touch_in(station)
    if journey.start != nil
      deduct(journey.fare)
      store_journey
    end
    fail "Insufficient funds!" if balance < MINIMUM_BALANCE
    journey.start_journey(station)
  end

  def touch_out(station)
    journey.finish_journey(station)
    deduct(journey.fare)
    store_journey
    @journey = Journey.new
  end

private
attr_accessor :journey
  def deduct(amount)
    @balance -= amount
  end

  def store_journey
    journeys << journey
  end
end
