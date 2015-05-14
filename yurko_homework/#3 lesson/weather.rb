require 'pry'
require 'net/http'
require 'json'

class Weather

  PATH = 'http://api.openweathermap.org/data/2.5/forecast/daily?' +
          'mode=json&units=metric&cnt=14&q='

  def initialize
    @city = ARGV.shift || 'lviv'
    @wind = ARGV.shift || 5
  end

  def run
    days = find_weather @wind, "Clear"
# binding.pry
    if days.empty?
      puts "Ooops.. non-flying weather in #{@city.capitalize}"
    elsif
      puts "Nearest good weather in #{@city.capitalize} " +
           "(with clear sky and wind <= #{@wind} mps): " +
           days.to_s
    end
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

  def check_wind day, wind_speed
    day["speed"] <= wind_speed.to_f
  end

  def check_precipitation day, precipitations
    day["weather"].first["main"] == precipitations
  end

  def get_date unix_time
    date_format = '%d.%m.%y'
    Time.at(unix_time).strftime(date_format)
  end

end

Weather.new.run
