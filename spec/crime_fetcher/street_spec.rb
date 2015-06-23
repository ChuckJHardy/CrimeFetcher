require 'spec_helper'
require 'crime_fetcher/street'

describe CrimeFetcher::Street do
  let(:instance) { described_class.new(events) }
  let(:events) { [event] }
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

  describe '#each' do
    it 'returns collection of Event objects' do
      instance.each do |obj|
        expect(obj).to be_an_instance_of(CrimeFetcher::Event)
      end
    end
  end
end
