class CrimeFetcher
  class Location
    def initialize(location)
      @location = location
    end

    def latitude
      location.fetch(:latitude)
    end

    def longitude
      location.fetch(:longitude)
    end

    protected

    attr_reader :location
  end
end
