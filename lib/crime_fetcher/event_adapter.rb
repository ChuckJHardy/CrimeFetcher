class CrimeFetcher
  class EventAdapter
    def initialize(event)
      @event = event
    end

    def self.adapt(*args)
      new(*args).adapt
    end

    def adapt
      {
        category: event.category,
        on: Date.parse(month),
        location_attributes: location_attributes,
      }
    end

    protected

    attr_reader :event

    private

    def month
      [event.month, '01'].join('-')
    end

    def location_attributes
      {
        address: event.location.name,
        latitude: event.location.latitude,
        longitude: event.location.longitude,
      }
    end
  end
end
