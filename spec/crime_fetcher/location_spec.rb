require 'spec_helper'
require 'crime_fetcher/location'

describe CrimeFetcher::Location do
  let(:instance) { described_class.new(location) }
  let(:location) do
    {
      latitude: '52.622258',
      longitude: '-1.119741',
      street: {
        id: 131_993_0,
        name: 'On or near Victoria Park'
      }
    }
  end

  describe '#name' do
    it 'returns name' do
      expect(instance.name).to eq(location[:street][:name])
    end
  end

  describe '#latitude' do
    it 'returns latitude' do
      expect(instance.latitude).to eq(location[:latitude])
    end
  end

  describe '#longitude' do
    it 'returns longitude' do
      expect(instance.longitude).to eq(location[:longitude])
    end
  end
end
