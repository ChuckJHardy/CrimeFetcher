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

    def month
      event.fetch(:month)
    end

    def location
      Location.new(event.fetch(:location))
    end

    def as_hash
      CrimeFetcher::EventAdapter.adapt(self)
    end

    protected

    attr_reader :event
  end
end
