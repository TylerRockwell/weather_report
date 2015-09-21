require 'httparty'
require 'byebug'

class Hurricanes

  def initialize
    @response = get_response
  end

  def active_list
    storm_list = ""
    @response["currenthurricane"].each do |hurricane|
      byebug
      storm_list << "#{hurricane["stormInfo"]["stormName_Nice"]} \n"
      #@response["currenthurricane"][0]["stormInfo"]["stormName_Nice"]
    end
    storm_list
  end


  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json")
  end
end
