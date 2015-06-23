class CrimeFetcher
  class Event
    def initialize(event)
      @event = event
    end

    def self.to_proc
      ->(event) { new(event) }
    end

    def category
      event.fetch(:category)
    end

    def location
      Location.new(event.fetch(:location))
    end

    protected

    attr_reader :event
  end
end
