require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'initializes with a balance of zero' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'allows balance to be topped up' do
      expect { oystercard.top_up(5) }.to change { oystercard.balance }.by 5
    end
    it "doesn't allow topping up past a maximum limit of £90" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      illegal_topup =  maximum_balance + 1 - oystercard.balance
      expect { oystercard.top_up(illegal_topup) }.to raise_error "Maximum balance of £#{maximum_balance} exceeded!"
    end
  end

  describe '#deduct' do
    it 'changes balance depending on the fare' do
      expect { oystercard.deduct(5) }.to change { oystercard.balance }.by -5
    end
  end

end
