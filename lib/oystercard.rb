class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance, :status

  def initialize
    @balance = 0.0
    @status = :not_in_transit
  end

  def top_up(amount)
    fail "Maximum balance of £#{MAXIMUM_BALANCE} exceeded!" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @status = :in_transit
  end

  def touch_out
    @status = :not_in_transit
  end

  def in_journey?
    @status == :in_transit
  end

end
