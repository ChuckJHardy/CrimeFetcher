require 'crime_fetcher/error'
require 'crime_fetcher/configuration'
require 'crime_fetcher/dto'
require 'crime_fetcher/street_dto'
require 'crime_fetcher/location'
require 'crime_fetcher/event_adapter'
require 'crime_fetcher/event'
require 'crime_fetcher/street'
require 'crime_fetcher/street_dto'

class CrimeFetcher
  extend Configure

  def initialize(lat:, lng:)
    @lat = lat
    @lng = lng
  end

  def street
    Street.new StreetDTO.get(lat: @lat, lng: @lng)
  end
end
