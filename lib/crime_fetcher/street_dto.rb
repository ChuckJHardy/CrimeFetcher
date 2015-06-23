class CrimeFetcher
  class StreetDTO < DTO
    def endpoint
      "crimes-street/all-crime?lat=#{lat}&lng=#{lng}"
    end

    private

    def lat
      options.fetch(:lat)
    end

    def lng
      options.fetch(:lng)
    end
  end
end
