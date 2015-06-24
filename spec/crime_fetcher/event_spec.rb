require 'spec_helper'
require 'crime_fetcher/event'

describe CrimeFetcher::Event do
  let(:instance) { [event].map(&described_class).first }
  let(:event) do
    {
      category: 'anti-social-behaviour',
      location_type: 'Force',
      location: {
        latitude: '52.622258',
        street: {
          id: 131_993_0,
          name: 'On or near Victoria Park'
        },
        longitude: '-1.119741'
      },
      context: '',
      outcome_status: nil,
      persistent_id: '',
      id: 206_011_61,
      location_subtype: '',
      month: '2013-01'
    }
  end

  describe '#category' do
    it 'returns category' do
      expect(instance.category).to eq(event[:category])
    end
  end

  describe '#month' do
    it 'returns month' do
      expect(instance.month).to eq(event[:month])
    end
  end

  describe '#location' do
    it 'returns location object' do
      expect(instance.location).to be_an_instance_of(CrimeFetcher::Location)
    end
  end

  describe '#as_hash' do
    it 'returns hash' do
      expect(instance.as_hash).to be_a(Hash)
    end
  end
end
