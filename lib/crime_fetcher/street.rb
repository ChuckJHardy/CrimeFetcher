class CrimeFetcher
  class Street
    include Enumerable

    def initialize(events)
      @events = events
    end

    def each(&block)
      events.each(&block)
    end

    def events
      @events.map(&CrimeFetcher::Event)
    end
  end
end
