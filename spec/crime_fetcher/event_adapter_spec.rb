require 'spec_helper'
require 'crime_fetcher/event'
require 'crime_fetcher/event_adapter'

describe CrimeFetcher::EventAdapter do
  subject(:adapter) { described_class.adapt(event) }

  let(:event) { CrimeFetcher::Event.new(event_attributes) }
  let(:event_attributes) do
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

  let(:adapted_hash) do
    {
      category: 'anti-social-behaviour',
      on: Date.parse(event_attributes[:month] + '-01'),
      location_attributes: {
        address: 'On or near Victoria Park',
        latitude: '52.622258',
        longitude: '-1.119741'
      }
    }
  end

  it 'returns expected hash' do
    expect(adapter).to eq(adapted_hash)
  end
end
