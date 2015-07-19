# Crime Fetcher - [ ![Codeship Status for ChuckJHardy/CrimeFetcher](https://codeship.com/projects/4a6dea20-1058-0133-f5b4-5a9b1173a114/status?branch=master)](https://codeship.com/projects/92019)

Wrapper for the Police UK API.

## Documentation

The [API](https://data.police.uk/docs/) provides a rich data source for information, including:

* Neighbourhood team members `Todo`
* Upcoming events `Todo`
* Street-level crime and outcome data `Covered in CrimeFetcher`
* Nearest police stations `Todo`

The API is implemented as a standard JSON web service using HTTP GET and POST requests. Full request and response examples are provided in the documentation.

## Installation

Add this line to your application's Gemfile:

    gem 'crime-fetcher', github: 'ChuckJHardy/CrimeFetcher'

And then execute:

    $ bundle

## Configuration

    CrimeFetcher.configure do |config|
      config.verbose = true
    end

* `domain` sets the base uri for Kimonolabs `https://data.police.uk/api/`
* `verbose` sets the logger level `false`

## Usage

Find Exchange Rate:

    crime_fetcher = CrimeFetcher.new(lat: 52.629729, lng: -1.131592, date: Date.today)
    # => #<CrimeFetcher:0x007f985c021f10>

    crime_fetcher.street
    # => #<CrimeFetcher::Street:0x007f985c021f10>

    crime_fetcher.street.as_hash
    # => { ... }

## Testing

    # Includes Rubocop
    $ bin/rspec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/CrimeFetcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
