require 'httparty'
require 'byebug'

class Hurricanes

  def initialize
    @response = get_response
  end

  def active_list
    storm_list = ""
    @response["currenthurricane"].each do |hurricane|
      storm_list << "#{hurricane["stormInfo"]["stormName_Nice"]} \n"
    end
    storm_list
  end


  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/currenthurricane/view.json")
  end
end
