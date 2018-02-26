class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0.0
    @entry_station = nil
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
