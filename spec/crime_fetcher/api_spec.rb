require 'spec_helper'
require 'crime_fetcher/api'

describe CrimeFetcher::API do
  describe '.get' do
    subject { described_class.get(url: url, options: options) }

    let(:url) { '/endpoint/Some Bad URL' }
    let(:options) { { key: 'value' } }

    let(:domain) { CrimeFetcher.configuration.domain }
    let(:connection) { double('Faraday') }

    before do
      allow(Faraday).to receive(:new).with(url: domain) { connection }
    end

    context 'when valid' do
      let(:response) do
        instance_double(Faraday::Response, status: 200, body: 'Body')
      end

      it 'calls off to Faraday' do
        expect(connection).to receive(:get)
          .with('/endpoint/Some%20Bad%20URL', options)
          .and_return(response)

        subject
      end
    end

    context 'when invalid' do
      let(:response) do
        instance_double(Faraday::Response, status: 500, body: 'Oops')
      end

      it 'raises error' do
        allow(connection).to receive(:get) { response }

        expect { subject }.to raise_error(CrimeFetcher::Invalid, 'Oops')
      end
    end
  end
end
