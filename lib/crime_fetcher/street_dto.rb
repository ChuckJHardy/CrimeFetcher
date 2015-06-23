class CrimeFetcher
  class StreetDTO < DTO
    def endpoint
      "4d393eu4?apikey=#{api_key}&kimpath1=#{type}&kimpath2=#{page}"
    end

    private

    def type
      options.fetch(:type)
    end

    def page
      options.fetch(:page)
    end

    def api_key
      CrimeFetcher.configuration.api_key
    end
  end
end
