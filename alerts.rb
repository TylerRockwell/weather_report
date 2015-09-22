require 'httparty'

class Alerts
  def initialize(zip: 0, city: 0, state: 0)
    @zip_code = zip
    @city = city
    @state = state
    @response = get_response
  end

  def get_alerts
    return "There are currently no weather alerts." if @response["alerts"].empty?
    output = ""
    @response["alerts"].each {|alert| output << "#{alert}\n"}
    output
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json") unless @zip_code == 0
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@state}/#{@city}.json") unless @state == 0
  end
end
