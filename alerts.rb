require 'httparty'

class Alerts
  def initialize(zip_code)
    @zip_code = zip_code
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
    HTTParty.get("http://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json")
  end
end
