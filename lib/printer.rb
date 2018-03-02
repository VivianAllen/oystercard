class Printer

  def print_journeys(journey_history)
    print_string = ""
    journey_history.each do |journey, i|
      print_string +=  print_time(journey.journey_time) + \
      print_line(journey.entry_station) + \
      " to " + print_line(journey.exit_station) + \
      ", Fare: #{journey.fare}\n"
    end
    print_string
  end

  private

  def print_time(time)
    time.strftime("%D  %H:%M") + ' : '
  end

  def print_line(station)
    "#{get_name(station)} (Zn#{get_zone(station)})"
  end

  def get_name(station)
    station ? station.name : 'NOT RECORDED (PENALTY)'
  end

  def get_zone(station)
    station ? station.zone : '-'
  end
end
