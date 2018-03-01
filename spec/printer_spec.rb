require 'printer'

describe Printer do
  subject(:printer) {described_class.new}
  let(:dbl_station1) { double :dbl_station1, name: "Aldgate", zone: 1}
  let(:dbl_station2) { double :dbl_station2, name: "Bank", zone: 1}
  let(:journey) { double :journey, entry_station: dbl_station1, exit_station: dbl_station2, fare: 1}
  let(:journey_log) { double :journey_log, journeys: [journey, journey] }

it 'prints a list of journeys' do
  expect(printer.print(journey_log)).to eq
    "1) #{dbl_station1.name} [#{dbl_station1.zone}] - #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey.fare}\n2) #{dbl_station1.name} [#{dbl_station1.zone}] - #{dbl_station2.name} [#{dbl_station2.zone}] - Fare: #{journey.fare}"
end

end
