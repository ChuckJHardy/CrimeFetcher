require 'vcr_helper'

describe CrimeFetcher do
  let(:instance) { described_class.new(lat: lat, lng: lng, date: date) }
  let(:lat) { '52.629729' }
  let(:lng) { '-1.131592' }

  describe '#street' do
    context 'when valid' do
      let(:date) { Date.today - 60 }

      it 'returns street object' do
        VCR.use_cassette('valid/crime_street') do
          expect(instance.street).to be_an_instance_of(CrimeFetcher::Street)
        end
      end
    end

    context 'when invalid' do
      let(:date) { Date.today }

      it 'raises error' do
        VCR.use_cassette('invalid/crime_street') do
          expect { instance.street }.to raise_error(CrimeFetcher::Invalid)
        end
      end
    end
  end
end
