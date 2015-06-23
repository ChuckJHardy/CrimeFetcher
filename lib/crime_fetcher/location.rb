class CrimeFetcher
  class Location
    def initialize(location)
      @location = location
    end

    def name
      street.fetch(:name)
    end

    def latitude
      location.fetch(:latitude)
    end

    def longitude
      location.fetch(:longitude)
    end

    protected

    attr_reader :location

    private

    def street
      location.fetch(:street)
    end
  end
end
