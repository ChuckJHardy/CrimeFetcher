require 'vcr_helper'

describe CrimeFetcher do
  let(:instance) { described_class.new(lat: lat, lng: lng) }

  describe '#street' do
    context 'when valid' do
      let(:lat) { '52.629729' }
      let(:lng) { '-1.131592' }

      it 'returns street object' do
        VCR.use_cassette('valid/crime_street') do
          expect(instance.street).to be_an_instance_of(CrimeFetcher::Street)
        end
      end
    end

    context 'when invalid' do
      let(:lat) { nil }
      let(:lng) { '-1.131592' }

      it 'raises error' do
        VCR.use_cassette('invalid/crime_street') do
          expect { instance.street }.to raise_error(CrimeFetcher::BadRequest)
        end
      end
    end
  end
end
