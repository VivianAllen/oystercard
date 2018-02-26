require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'initializes with a balance of zero' do
      expect(oystercard.balance).to eq 0
    end
  end

end
