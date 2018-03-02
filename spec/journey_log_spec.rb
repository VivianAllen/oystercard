require 'journey_log.rb'

describe JourneyLog do

  let(:dbl_jclass_finished) {double :Journey, new: dbl_j_finished }
  let(:dbl_j_finished) { double :journey,
    entry_station: dbl_station2,
    exit_station: dbl_station,
    finish: dbl_j_finished_return
   }
  let(:dbl_j_return) { double :journey }

  let(:dbl_jclass_unfinished) {double :Journey, new: dbl_j_unfinished }
  let(:dbl_j_unfinished) { double :journey,
    entry_station: dbl_station2,
    exit_station: nil,
    finish: dbl_j_return
   }

  let(:dbl_jclass_unstarted) {double :Journey, new: dbl_j_unstarted }
  let(:dbl_j_unstarted) { double :journey,
    entry_station: nil,
    exit_station: dbl_station1,
    finish: dbl_j_return
   }

  let(:dbl_station) { double :dbl_station }
  let(:dbl_station2) { double :dbl_station2 }

  context 'complete journeys' do
    subject { described_class.new(dbl_jclass_unfinished) }
    it 'records a complete journey' do
      subject.start(dbl_station)
      subject.finish(dbl_station2)
      expect(subject.journeys.count).to eq 1
    end
  end

  context 'incomplete journeys' do
    context 'starting with incomplete journeys' do
      it 'records unfinished journeys' do
        subject { described_class.new(dbl_jclass_unfinished) }
        subject.start(dbl_station)
        subject.start(dbl_station)
        expect(subject.journeys.count).to eq 2
      end
      it 'records unstarted journeys' do
        subject { described_class.new(dbl_jclass_unstarted) }
        subject.finish(dbl_station2)
        subject.finish(dbl_station2)
        expect(subject.journeys.count).to eq 2
      end
    end
  end
end
