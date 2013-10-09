class DigiLcdServer < Sinatra::Application
  get '/apps/weather/:zip' do
    display_message(get_forecast(get_coordinates(params)), SPARK, {loop: params[:loop]})
  end
end