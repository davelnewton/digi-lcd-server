def get_forecast(coords)
  forecast = ForecastIO.forecast(coords[0], coords[1])
  final_forecast = ""
  icon = forecast["daily"]["data"][0]["icon"]
  final_forecast += capitalize(icon + " ")
  if RAINY.include?(icon)
    final_forecast += forecast["daily"]["data"][0]["precipProbability"].to_s[2..-1] + "% "
  end
  final_forecast += "#{forecast['daily']['data'][0]['summary']}"
end