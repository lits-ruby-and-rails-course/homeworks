require 'json'
require 'open-uri'

puts "Choose Ukrainian city!"
city = gets.chomp
puts "Maximum wind speed?"
wind = gets.chomp
puts "Results:"
puts "----------------------"

def sunny_weather(city, wind)
  weather_url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city},ua&cnt=14&mode=json"

  city_forecast = JSON.load open(weather_url)
  days_forecast = city_forecast["list"]

  for i in(0...days_forecast.length)
    weather       = days_forecast[i]["weather"][0]
    wind_speed    = days_forecast[i]["speed"].to_f
    weather_date  = Time.at(days_forecast[i]["dt"])
    date          = weather_date.strftime("%A, %B %d")

    if (weather["main"] != 'Rain') and (wind_speed < wind.to_f)
      puts city_forecast["city"]["name"] + "\t" + date
    end
  end
end

sunny_weather(city, wind)