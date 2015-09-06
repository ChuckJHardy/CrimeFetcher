require 'spec_helper'

describe CrimeFetcher::Validate do
  subject(:validator) do
    described_class.with(
      method: :get,
      domain: 'www',
      url: 'example.com',
      options: { query: 1 },
      response: response
    )
  end

  let(:response) { double('Faraday::Response', status: status, body: body) }
  let(:body) { {} }
  let(:status) { 200 }

  before do
    CrimeFetcher.configuration.log = true
    expect(CrimeFetcher.configuration.logger).to receive(:info)
  end

  it 'returns true when nothing is wrong' do
    expect(validator).to be_truthy
  end

  describe 'When BadRequest' do
    let(:status) { 400 }

    it 'raises error' do
      expect { validator }.to raise_error(
        CrimeFetcher::BadRequest
      ) do |e|
        expect(e.message).to eq(
          domain: 'www',
          url: 'example.com',
          options: { query: 1 },
          response: {
            status: status,
            body: body
          }
        )
      end
    end
  end

  after do
    CrimeFetcher.configuration.log = false
  end
end
