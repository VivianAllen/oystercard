class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :status

  def initialize
    @balance = 0.0
    @status = :not_in_transit
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") if @balance < MINIMUM_FARE
    @status = :in_transit
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @status = :not_in_transit
  end

  def in_journey?
    @status == :in_transit
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
