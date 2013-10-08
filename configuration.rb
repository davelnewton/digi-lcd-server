ForecastIO.configure do |configuration|
  configuration.api_key = ENV['FORECAST_IO_KEY']
end

RAINY = ["rain", "snow", "sleet", "cloudy", "partly-cloudy-day", "partly-cloudy-night"]