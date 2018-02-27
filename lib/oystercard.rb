class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance

  def initialize(journey_log_class = JourneyLog)
    @balance = 0.0
    @journey_log = journey_log_class.new
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") if @balance < MINIMUM_FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
  end

  def journey_history
    @journey_log.journeys
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
