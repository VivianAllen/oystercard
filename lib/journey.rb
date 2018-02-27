class Journey
attr_accessor :entry_station, :exit_station

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
    @exit_station && @entry_station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end
end
