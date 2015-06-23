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

    it 'calls off to Faraday' do
      expect(connection).to receive(:get)
        .with('/endpoint/Some%20Bad%20URL', options)

      subject
    end
  end
end
