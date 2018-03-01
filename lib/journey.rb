class Journey
attr_reader :entry_station, :exit_station

PENALTY_FARE = 6
MINIMUM_FARE = 1

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
    self
  end

  def complete?
    !!@exit_station && !!@entry_station
  end

  def fare
    complete? ? fare_calculator : PENALTY_FARE
  end

private

def fare_calculator
  MINIMUM_FARE + (entry_station.zone - exit_station.zone).abs
end

end
