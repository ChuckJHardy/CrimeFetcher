require 'crime_fetcher/configuration'
require 'crime_fetcher/dto'
require 'crime_fetcher/street_dto'

class CrimeFetcher
  extend Configure

  def initialize(lat:, lng:, date: Date.today)
    @lat = lat
    @lng = lng
    @date = date
  end
end
