require 'httparty'
require 'byebug'

class Forecast
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def fc_text(period)
    "#{@response["forecast"]["txt_forecast"]["forecastday"][period]["title"]}:\n#{@response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]}\n"
  end

  def ten_day
    output = ""
    (0..18).step(2) do |day|
      output << fc_text(day)
    end
    output
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip_code}.json")
  end
end
