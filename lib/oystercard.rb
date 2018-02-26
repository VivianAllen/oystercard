class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0.0
  end

  def top_up(amount)
    fail "Maximum balance of £#{MAXIMUM_BALANCE} exceeded!" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
