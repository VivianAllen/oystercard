require 'journey_log.rb'

require 'journey_log'
describe JourneyLog do
  let(:dbl_station) { double :dbl_station }
  let(:dbl_station2) { double :dbl_station2 }
  let(:dbl_journey2) { double :dbl_journey2 }
  let(:dbl_journey) { double :dbl_journey,
    finish: dbl_journey2,
    exit_station: dbl_station
   }
  let(:dbl_journey_class) {double :dbl_journey_class, new: dbl_journey }
  subject { described_class.new(dbl_journey_class) }

  context 'incomplete journeys' do
    it 'records an unfinished journey' do
      subject.start(dbl_station)
      expect(subject.journeys).to include dbl_journey
    end
    it 'records an unstarted journey' do
      subject.finish(dbl_station)
      expect(subject.journeys).to include dbl_journey2
    end
  end

  context 'complete journeys' do
    it 'records a complete journey' do
      subject.start(dbl_station)
      subject.finish(dbl_station2)
      expect(subject.journeys).to include dbl_journey
    end
  end
end
