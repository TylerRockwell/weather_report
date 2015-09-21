require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions'
require 'json'

class CurrentConditions
  private def get_response
    info_file = File.read('current_conditions_durham.json')
    JSON.parse(info_file)
  end
end

class WeatherReportTest < Minitest::Test

  def test_weather_type_01
    assert_equal "Overcast", CurrentConditions.new(27701).type
  end

  def test_current_temp_in_fahrenheit_02
    assert_equal "71.9 F (22.2 C)", CurrentConditions.new(27701).temperature
  end

  def test_get_feels_like_temp_03
    assert_equal "71.9 F (22.2 C)", CurrentConditions.new(27701).feels_like_temp
  end

  def test_get_wind_speed_and_direction
    assert_equal "0.0 MPH NW", CurrentConditions.new(27701).wind_speed
  end
end
