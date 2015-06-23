require 'spec_helper'
require 'crime_fetcher/event'

describe CrimeFetcher::Event do
  let(:instance) { [event].map(&described_class).first }
  let(:event) do
    {
      category: "anti-social-behaviour",
      location_type: "Force",
      location: {
        latitude: "52.622258",
        street: {
          id: 1319930,
          name: "On or near Victoria Park"
        },
        longitude: "-1.119741"
      },
      context: "",
      outcome_status: nil,
      persistent_id: "",
      id: 20601161,
      location_subtype: "",
      month: "2013-01"
    }
  end

  describe '#category' do
    it 'returns category' do
      expect(instance.category).to eq(event[:category])
    end
  end

  describe '#location' do
    it 'returns location object' do
      expect(instance.location).to be_an_instance_of(CrimeFetcher::Location)
    end
  end
end
