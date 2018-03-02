require './lib/oystercard.rb'
card = Oystercard.new
bank = Station.new('Bank', 1)
aldgate = Station.new('Aldgate', 1)
finsburypark = Station.new('Finsbury Park', 3)
card.top_up(20)
