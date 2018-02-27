require 'journey'
describe Journey do
  let(:dbl_station1) { double :dbl_station1 }
  let(:dbl_station2) { double :dbl_station2 }

  it "returns itself when exiting a journey" do
    expect(subject.finish(dbl_station1)).to eq(subject)
  end

  context 'given an entry station' do
    subject {described_class.new(dbl_station1)}
    it 'has an entry station' do
      expect(subject.entry_station).to eq dbl_station1
    end
    it 'does not have an exit station do' do
      expect(subject.exit_station).to be nil
    end
    it 'knows it is incomplete' do
      expect(subject).not_to be_complete
    end
    it 'returns a penalty fare ' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'given an exit station' do
    subject { described_class.new }
    before do
      subject.finish(dbl_station1)
    end
    it 'has an exit station' do
      expect(subject.exit_station).to eq dbl_station1
    end
    it 'does not have an entry station' do
      expect(subject.entry_station).to be nil
    end
    it 'knows it is incomplete' do
      expect(subject).not_to be_complete
    end
    it 'returns a penalty fare ' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'given both entry and exit stations' do
    subject {described_class.new(dbl_station1)}
    before do
      subject.finish(dbl_station2)
    end
    it 'knows it is complete' do
      expect(subject).to be_complete
    end
    it 'returns a minimum fare' do
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
  end
end
