require 'json'
require 'open-uri'

puts "Choose Ukrainian city!"
city = gets.chomp
puts "Maximum wind speed?"
wind = gets.chomp
puts "Results:"
puts "----------------------"

def sunny_weather(city, wind)
  ### url on openwether with city parameter interpolated
  weather_url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city},ua&cnt=14&mode=json"

  ### Use JSON for sending GET request and parsing JSON data
  city_forecast = JSON.load(open(weather_url))
  ### Fetching data from JSON data
  days_forecast = city_forecast["list"]

  ### We have data only for 2 weeks, so iterating through all JSON data that was parsed
  for i in(0...days_forecast.length)
    ### Three variables with fetched data from the Hash object that was produced by JSON.load()
    weather       = days_forecast[i]["weather"][0]
    wind_speed    = days_forecast[i]["speed"].to_f
    weather_date  = Time.at(days_forecast[i]["dt"])
    ### Formating date
    date          = weather_date.strftime("%A, %B %d")

    ### Outputting nearest sunny and not windy days for particular city
    if (weather["main"] != 'Rain') and (wind_speed < wind.to_f)
      puts city_forecast["city"]["name"] + "\t" + date
    end
  end
end

sunny_weather(city, wind)