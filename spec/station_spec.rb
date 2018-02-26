require './lib/station.rb'

describe Station do

  subject(:station) { described_class.new(:name, :zone) }

  describe 'station info' do

    describe 'station name' do
      it 'saves station name' do
        expect(station.name).to be :name
      end
    end

    describe 'station zone' do
      it 'saves station zone' do
        expect(station.zone).to be :zone
      end
    end

  end
end
