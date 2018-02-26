class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :status

  def initialize
    @balance = 0.0
    @status = :not_in_transit
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_BALANCE}") if @balance < MINIMUM_BALANCE
    @status = :in_transit
  end

  def touch_out
    @status = :not_in_transit
  end

  def in_journey?
    @status == :in_transit
  end

end
