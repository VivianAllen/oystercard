class Printer

  def print_journeys(journey_history)
    print_string = ""
    journey_history.each_with_index do |journey, i|
      print_string += "#{i+1}) " + print_line(journey.entry_station) + " to " + print_line(journey.exit_station) + " - Fare: #{journey.fare}\n"
    end
    print_string
  end

  private

  def print_line(station)
    "#{get_name(station)} [#{get_zone(station)}]"
  end

  def get_name(station)
    station ? station.name : 'NOT RECORDED (PENALTY)'
  end

  def get_zone(station)
    station ? station.zone : '-'
  end
end
