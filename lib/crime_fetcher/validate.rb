class CrimeFetcher
  class Validate
    def initialize(method:, domain:, url:, options:, response:)
      @method = method
      @domain = domain
      @url = url
      @options = options
      @response = response
    end

    def self.with(*args)
      new(*args).validate
    end

    def validate
      log

      # rubocop:disable Style/RaiseArgs
      fail BadRequest.new(error_args) if bad_request?
      # rubocop:enable Style/RaiseArgs

      true
    end

    private

    attr_reader :response

    def error_args
      {
        domain: @domain,
        url: @url,
        options: @options,
        status: response.status,
        body: response.body
      }
    end

    def bad_request?
      response.status != 200
    end

    def log
      CrimeFetcher.configuration.logger.info(
        "-> CrimeFetcher Response: #{@method.upcase}\n#{error_args}"
      ) if CrimeFetcher.configuration.log
    end
  end
end
