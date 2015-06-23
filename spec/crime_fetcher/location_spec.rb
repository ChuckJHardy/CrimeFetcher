require 'spec_helper'
require 'crime_fetcher/location'

describe CrimeFetcher::Location do
  let(:instance) { described_class.new(location) }
  let(:location) do
    {
      latitude: "52.622258",
      longitude: "-1.119741",
      street: {
        id: 1319930,
        name: "On or near Victoria Park"
      }
    }
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
