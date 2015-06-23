require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/multi_json'

class CrimeFetcher
  Invalid = Class.new(StandardError)

  class API
    def self.get(*args)
      new.get(*args)
    end

    def get(url:, options: {})
      connection.get(URI.escape(url), options).tap do |response|
        raise CrimeFetcher::Invalid, response.body if response.status == 500
      end
    end

    private

    def domain
      CrimeFetcher.configuration.domain
    end

    def verbose?
      CrimeFetcher.configuration.verbose
    end

    def connection
      Faraday.new(url: domain) do |faraday|
        faraday.use Faraday::Response::Logger if verbose?

        faraday.response :multi_json,
                         content_type: /\bjson$/,
                         symbolize_keys: true

        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
