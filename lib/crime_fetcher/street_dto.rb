class CrimeFetcher
  class StreetDTO < DTO
    def endpoint
      "crimes-street/all-crime?lat=#{lat}&lng=#{lng}&date=#{formatted_date}"
    end

    private

    def lat
      options.fetch(:lat)
    end

    def lng
      options.fetch(:lng)
    end

    def date
      options.fetch(:date)
    end

    def formatted_date
      date.strftime('%Y-%m')
    end
  end
end
