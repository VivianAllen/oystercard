require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'initializes with a balance of zero' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'initializes with a balance of zero' do
      old_balance = oystercard.balance
      oystercard.top_up(5)
      expect(oystercard.balance).to eq (old_balance + 5)
    end
  end

end
