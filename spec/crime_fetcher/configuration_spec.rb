require 'spec_helper'
require 'crime_fetcher/configuration'

describe CrimeFetcher::Configure do
  let(:instance) { Class.new { extend CrimeFetcher::Configure } }

  describe '#domain' do
    subject { instance.configuration.domain }

    let(:default_domain) { 'https://data.police.uk/api/' }
    let(:new_domain) { 'http://localhost:1111' }

    it 'returns a default new_domain' do
      expect(subject).to eq(default_domain)
    end

    it 'returns altered new domain' do
      instance.configure { |config| config.domain = new_domain }
      expect(subject).to eq(new_domain)
    end
  end

  describe '#verbose' do
    subject { instance.configuration.verbose }

    it 'returns a default new_domain' do
      expect(subject).to eq(false)
    end

    it 'returns altered verbose' do
      instance.configure { |config| config.verbose = true }
      expect(subject).to eq(true)
    end
  end
end
