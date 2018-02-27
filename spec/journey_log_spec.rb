require 'journey_log.rb'

require 'journey_log'
describe JourneyLog do

  let(:journey){ double :journey } #this may need to have some methods
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class)}

  describe '#start' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end

    it 'records a journey' do
      subject.start(station)
      expect(subject.journeys).to include journey
    end
  end
end
