require_relative './journey_log.rb'
require_relative './journey.rb'
require_relative './station.rb'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(jlog_class = JourneyLog, jclass = Journey)
    @journey_log = jlog_class.new(jclass)
    @top_up_sum = 0.0
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if balance + amount > MAXIMUM_BALANCE
    @top_up_sum += amount
  end

  def touch_in(station)
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") if balance < MINIMUM_FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
  end

  def journey_history
    @journey_log.journeys
  end

  def balance
    @top_up_sum - sum_fares
  end

  private

  def sum_fares
    return 0.0 unless journey_history
    summed_fares = 0.0
    journey_history.each do |journey|
      summed_fares += journey.fare
    end
  end

end
