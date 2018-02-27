class JourneyLog

  def initialize(journey_class=Journey)
      @journeys = []
      @journey_class = journey_class
      @on_journey = false
  end

  def start(station)
    current_journey = @journey_class.new(station)
    @journeys.push(current_journey)
    @on_journey = true
  end

  def finish(station)
    if @on_journey
      @journeys[-1].finish(station)
    else
      current_journey = @journey_class.new
      current_journey.finish(station)
      @journeys.push(current_journey)
    end
    @on_journey = false
  end

  def journeys
    @journeys.dup
  end

end
