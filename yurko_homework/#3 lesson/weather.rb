require 'pry'
require 'net/http'
require 'json'

class Weather

  PATH = 'http://api.openweathermap.org/data/2.5/forecast/daily?' +
          'mode=json&units=metric&cnt=14&q='

  def initialize
    @city = 'lviv'
  end

  def run
    puts 'Nearest good weather:'
    puts find_weather 5, "Clear"
  end

  private

  def get_forecast
    raw_response = Net::HTTP.get_response URI.parse(PATH + @city)
    forecast = (JSON.parse raw_response.body)["list"]
  end

  def find_weather wind_speed, precip
    get_forecast.map {|day| get_date day["dt"] if
      check_wind(day, wind_speed) && check_precipitation(day, precip)}.compact
  end

  def check_wind day, speed
    day["speed"] <= speed
  end

  def check_precipitation day, precip
    day["weather"].first["main"] == precip
  end

  def get_date unix_time
    date_format = '%d.%m.%y'
    Time.at(unix_time).strftime(date_format)
  end

end

Weather.new.run
