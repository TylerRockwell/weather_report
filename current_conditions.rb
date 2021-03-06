require 'httparty'
require 'byebug'

class CurrentConditions
  def initialize(zip: 0, city: 0, state: 0)
    @zip_code = zip
    @city = city
    @state = state
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

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip_code}.json") unless @zip_code == 0
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@state}/#{@city}.json") unless @state == 0
  end
end
