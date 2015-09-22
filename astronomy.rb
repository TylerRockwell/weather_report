require 'httparty'

class Astronomy
  def initialize(zip: 0, city: 0, state: 0)
    @zip_code = zip
    @city = city
    @state = state
    @response = get_response
  end

  def sunrise
    "#{@response["sun_phase"]["sunrise"]["hour"]}:#{@response["sun_phase"]["sunrise"]["minute"]}"
  end

  def sunset
    "#{@response["sun_phase"]["sunset"]["hour"]}:#{@response["sun_phase"]["sunset"]["minute"]}"
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json") unless @zip_code == 0
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@state}/#{@city}.json") unless @state == 0
  end
end
