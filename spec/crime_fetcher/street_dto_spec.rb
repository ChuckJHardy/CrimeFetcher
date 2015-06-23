require 'spec_helper'
require 'crime_fetcher/dto'
require 'crime_fetcher/street_dto'

describe CrimeFetcher::StreetDTO do
  let(:instance) { described_class.new(options: options) }
  let(:options) { { lat: :lat, lng: :lng, date: Date.parse('2015-01-02') } }

  describe '#endpoint' do
    let(:expected_endpoint) do
      'crimes-street/all-crime?lat=lat&lng=lng&date=2015-01'
    end

    it 'returns expected url' do
      expect(instance.endpoint).to eq(expected_endpoint)
    end
  end
end
