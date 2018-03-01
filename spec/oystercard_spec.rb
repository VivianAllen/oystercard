require 'oystercard'

describe Oystercard do

  let(:dbl_station) { double :db_station }
  let(:dbl_journey) { double :dbl_journey,
    fare: 1
  }
  let(:dbl_log) { double :dbl_log,
    start: nil,
    finish: nil,
    journeys: [dbl_journey, dbl_journey]
   }
  let(:dbl_log_class) { double :dbl_log_class,
     new: dbl_log
    }
  let(:dbl_printer) { double :printer, print_journeys: nil}
  let(:dbl_jclass) { double :dbl_jclass, new: dbl_journey }
  subject { described_class.new(dbl_log_class, dbl_jclass, dbl_printer) }

context 'balance adjustment' do
it 'calculates balance' do
    expect(subject.balance).to eq -2
  end
  it 'allows balance to be topped up' do
    expect { subject.top_up(5) }.to change { subject.balance }.by 5
  end
  it "doesn't allow topping up past a maximum limit of £90" do
    illegal_topup =  Oystercard::MAXIMUM_BALANCE + 1 - subject.balance
    expect { subject.top_up(illegal_topup) }.to raise_error "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} exceeded!"
  end
end

  context 'When balance is 0' do
    it 'denies touch_in if balance is less than Minimum Fare' do
      expect{
        subject.touch_in(dbl_station)
      }.to raise_error("Minimum balance for travel is £#{Oystercard::MINIMUM_FARE}")
    end
  end

  context 'when balance is 10' do
    before do
      subject.top_up(10)
    end
    describe '#touch_in' do
      it 'messages journey log to start' do
        expect(dbl_log).to receive(:start)
        subject.touch_in(dbl_station)
      end
    end
    describe '#touch_out' do
      it 'messages journey log to finish' do
        expect(dbl_log).to receive(:finish)
        subject.touch_out(dbl_station)
      end
    end
  end

  describe '#journey_history' do
    it 'messages journey log printer to print history' do
      expect(dbl_printer).to receive(:print_journeys)
      subject.journeys
    end
  end
end
