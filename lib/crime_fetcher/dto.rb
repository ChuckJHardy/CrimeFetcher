require 'crime_fetcher/api'

class CrimeFetcher
  class DTO
    attr_reader :options

    def initialize(options:)
      @options = options
    end

    def self.get(options = {})
      new(options: options).response(:get)
    end

    def response(method)
      log(method: method)
      API.public_send(method, url: endpoint, options: params).body
    end

    def params
      {}
    end

    def endpoint
      fail NotImplementedError, 'Inheriting class must implement'
    end

    private

    def domain
      CrimeFetcher.configuration.domain
    end

    def log(method:)
      CrimeFetcher.configuration.logger.info([
        "-> CrimeFetcher Request: #{method.upcase}",
        "domain: #{domain}",
        "endpoint: #{endpoint}",
        'api_key: NONE',
        "params: #{params}"
      ].join("\n")) if CrimeFetcher.configuration.log
    end
  end
end
