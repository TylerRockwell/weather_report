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

  def dewpoint
    @response["current_observation"]["dewpoint_string"]
  end

  def humidity
    @response["current_observation"]["relative_humidity"]
  end

  def get_it_all_pretty
    "Here are the current conditions for #{@zip_code}:\n
    It is currently #{type}.\n
    The current temperature is #{temperature}\n
    But it feels more like #{feels_like_temp}.\n
    Humidity is at: #{humidity}.\n
    The dewpoint is: #{dewpoint}.\n
    Current wind speed is: #{wind_speed}"
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/4d6eeefee9303bc0/geolookup/q/#{@zip_code}.json")
  end
end
