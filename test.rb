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

  def test_get_wind_speed_and_direction_04
    assert_equal "0.0 MPH NW", CurrentConditions.new(27701).wind_speed
  end

  def test_get_dewpoint_05
    assert_equal "69 F (20 C)", CurrentConditions.new(27701).dewpoint
  end

  def test_get_humidity_06
    assert_equal "90%", CurrentConditions.new(27701).humidity
  end

  def test_show_all_conditions_07
    assert_equal "Here are the current conditions for 27701:\n
    It is currently Overcast.\n
    The current temperature is 71.9 F (22.2 C)\n
    But it feels more like 71.9 F (22.2 C).\n
    Humidity is at: 90%.\n
    The dewpoint is: 69 F (20 C).\n
    Current wind speed is: 0.0 MPH NW", CurrentConditions.new(27701).get_it_all_pretty
  end
end
