require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:dbl_station1) { double :dbl_station1, name: "Aldgate", zone: 1}
  let(:dbl_station2) { double :dbl_station2, name: "Bank", zone: 1}
  let(:journey1) { double :journey1, entry_station: dbl_station1, exit_station: dbl_station2, fare: 1}
  let(:journey2) { double :journey2, entry_station: nil, exit_station: dbl_station2, fare: 6}

  it 'prints a list of journeys' do
    journey_log = [journey1, journey1]
    expect(printer.print_journeys(journey_log)).to eq "1) #{dbl_station1.name} [#{dbl_station1.zone}] to #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey1.fare}\n2) #{dbl_station1.name} [#{dbl_station1.zone}] to #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey1.fare}\n"
  end

  it 'handles unfinished journeys' do
    journey_log = [journey1, journey2]
    expect(printer.print_journeys(journey_log)).to eq "1) #{dbl_station1.name} [#{dbl_station1.zone}] to #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey1.fare}\n2) NOT RECORDED (PENALTY) [-] to #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey2.fare}\n"
  end



end
