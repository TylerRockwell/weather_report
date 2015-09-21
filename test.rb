require 'minitest/autorun'
require 'minitest/pride'
require './code'
require 'json'

class CurrentConditions
  private def get_response
    info_file = File.read('current_conditions_durham.json')
    JSON.parse(info_file)
  end
end

class Forecast
  private def get_response
    info_file = File.read('forecast_durham.json')
    JSON.parse(info_file)
  end
end

class Astronomy
  private def get_response
    info_file = File.read('astronomy_durham.json')
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

  def test_get_1_day_forecast_text_08
    assert_equal "Monday:\nOvercast with rain showers at times. Thunder possible. High near 75F. Winds NE at 5 to 10 mph. Chance of rain 40%.\n",
                 Forecast.new(27701).fc_text(0)
  end

  def test_get_10_day_forecast_text_09
    assert_equal "Monday:\nOvercast with rain showers at times. Thunder possible. High near 75F. Winds NE at 5 to 10 mph. Chance of rain 40%.\n\
Tuesday:\nCloudy early with partial sunshine expected late. Slight chance of a rain shower. High 78F. Winds NNE at 10 to 15 mph.\n\
Wednesday:\nMostly sunny skies. High near 80F. Winds NNE at 10 to 15 mph.\n\
Thursday:\nOvercast with rain showers at times. High 78F. Winds NNE at 10 to 20 mph. Chance of rain 60%.\n\
Friday:\nRain likely. High 76F. Winds NE at 10 to 15 mph. Chance of rain 90%. Rainfall near a quarter of an inch.\n\
Saturday:\nRain showers in the morning becoming more intermittent in the afternoon. High 74F. Winds NE at 10 to 15 mph. Chance of rain 60%.\n\
Sunday:\nPartly cloudy skies during the morning hours will become overcast in the afternoon. High 74F. Winds NE at 10 to 15 mph.\n\
Monday:\nCloudy with periods of rain. High 74F. Winds NE at 10 to 15 mph. Chance of rain 70%. Rainfall around a half an inch.\n\
Tuesday:\nRain showers early with overcast skies later in the day. High 77F. Winds NE at 5 to 10 mph. Chance of rain 40%.\n\
Wednesday:\nCloudy skies early, followed by partial clearing. High near 80F. Winds NE at 5 to 10 mph.\n",
    Forecast.new(27701).ten_day
  end

  def test_get_sunrise_sunset_10
    a = Astronomy.new(27701)
    assert_equal "7:02", a.sunrise
    assert_equal "19:14", a.sunset
  end
end
