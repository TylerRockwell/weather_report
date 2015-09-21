require 'httparty'
require 'byebug'

class CurrentConditions
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def temperature
    @response["current_observation"]["temperature_string"]
  end

  def type
    @response["current_observation"]["weather"]
  end

  def feels_like_temp
    @response["current_observation"]["feelslike_string"]
  end

  def wind_speed
    "#{@response["current_observation"]["wind_mph"]} MPH #{@response["current_observation"]["wind_dir"]}"
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/4d6eeefee9303bc0/geolookup/q/#{@zip_code}.json")
  end
end


# puts "Enter a city: "
# astronomy = Astronomy.new(gets.chomp)
#
# puts astronomy.age_of_moon
