class DigiLcdServer < Sinatra::Application
  get '/apps/weather/:zip' do
    if !params[:address].nil?
      coords = Geocoder.coordinates(params[:address])
    elsif !params[:zip].nil?
      coords = Geocoder.coordinates(params[:zip])
    else
      coords = Geocoder.coordinates(request.ip) 
    end
    begin
      display_message(get_forecast(coords), SPARK, {loop: params[:loop]})
      "Message displayed successfully."
    rescue
      "There was an error displaying your message."
    end
  end
end