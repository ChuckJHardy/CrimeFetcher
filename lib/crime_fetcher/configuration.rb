class CrimeFetcher
  module Configure
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end

    private

    class Configuration
      attr_accessor :domain, :verbose

      def initialize
        self.domain = 'https://data.police.uk/api/'
        self.verbose = false
      end
    end
  end
end
