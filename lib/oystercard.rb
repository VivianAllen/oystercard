require_relative './journey_log.rb'
require_relative './journey.rb'
require_relative './station.rb'
require_relative './printer.rb'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(jlog_class = JourneyLog, jclass = Journey, \
    printer = Printer.new, clock=Time)
    @journey_log = jlog_class.new(jclass)
    @top_ups = []
    @printer = printer
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") \
    if balance + amount > MAXIMUM_BALANCE
    @top_ups << {time: Time.now, amount: amount}
  end

  def touch_in(station)
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") \
    if balance < MINIMUM_FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
  end

  def balance
    sum_top_ups - sum_fares
  end

  def journey_history
    puts @printer.print_journeys(get_journeys)
  end

  def top_up_history(format=true)
    if format
      puts top_up_list
    else
      return top_up_list
    end
  end

  private

  def get_journeys
    @journey_log.journeys
  end

  def sum_top_ups
    @top_ups.reduce(0.0) do |sum, top_up|
      sum + top_up[:amount]
    end
  end

  def sum_fares
    get_journeys.reduce(0.0) do |sum, journey|
      sum + journey.fare
    end
  end

  def print_time(time)
    time.strftime("%D  %H:%M")
  end

  def top_up_list
    print_string = ""
    @top_ups.each do |top_up|
      print_string += print_time(top_up[:time]) + \
      " : £#{top_up[:amount]}\n"
    end
    print_string
  end

end
