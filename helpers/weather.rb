def get_forecast(params)
  coords = get_coordinates(params)
  forecast = ForecastIO.forecast(coords[0], coords[1])
  final_forecast = ""
  icon = forecast["daily"]["data"][0]["icon"]
  final_forecast += capitalize(icon + " ")
  if RAINY.include?(icon)
    if forecast["daily"]["data"][0]["precipProbability"] != 0
      final_forecast += forecast["daily"]["data"][0]["precipProbability"].to_s[2..-1] + "% "
    end
  end
  final_forecast += "#{forecast['daily']['data'][0]['summary']}"
  final_forecast
end

def get_coordinates(params)
  if !params[:address].nil?
    coords = Geocoder.coordinates(params[:address])
  elsif !params[:zip].nil?
    coords = Geocoder.coordinates(params[:zip])
  elsif request.ip != "0.0.0.0" || request.ip != "127.0.0.1"
    coords = Geocoder.coordinates(request.ip) 
  else
    raise "Unable to geolocate you."
  end
end