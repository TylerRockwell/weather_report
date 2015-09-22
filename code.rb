require './current_conditions'
require './forecast'
require './astronomy'
require './alerts'
require './hurricanes'
require './location_parser'

puts "Please enter a zip code: "
input = gets.chomp

parser = LocationParser.new

type = parser.get_type(input)

# Create weather objects

# current_conditions = CurrentConditions.new(zip_code)
# forecast = Forecast.new(zip_code)
# astronomy = Astronomy.new(zip_code)
# alerts = Alerts.new(zip_code)
# hurricanes = Hurricanes.new
#
#
# # Get weather forecast
# puts "Here are the current conditions for #{zip_code}:"
# puts "It is currently #{current_conditions.type}."
# puts "The current temperature is #{current_conditions.temperature}"
# puts"But it feels more like #{current_conditions.feels_like_temp}."
# puts "Humidity is at: #{current_conditions.humidity}."
# puts "The dewpoint is: #{current_conditions.dewpoint}."
# puts "Current wind speed is: #{current_conditions.wind_speed}"
# puts
# puts "Here is your 10 day forecast:"
# puts
# puts forecast.ten_day
# puts
# puts "Sunrise is at #{astronomy.sunrise}"
# puts "Sunset is at #{astronomy.sunset}"
# puts
# puts "Here are your current weather alerts:"
# puts
# puts alerts.get_alerts
# puts
# puts "Here is a list of active hurricanes:"
# puts
# puts hurricanes.active_list
