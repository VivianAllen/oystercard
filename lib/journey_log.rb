class JourneyLog

  def initialize(journey_class=Journey)
      @journeys = []
      @journey_class = journey_class
  end

  def start(station)
    @journeys.push(@journey_class.new(station))
  end

  def finish(station)
    if unstarted_journey?
      @journeys.push(@journey_class.new.finish(station))
    else
      @journeys[-1].finish(station)
    end
  end

  def journeys
    @journeys.dup
  end

  private

  def unstarted_journey?
    @journeys.empty? || !!@journeys[-1].exit_station
  end
end
