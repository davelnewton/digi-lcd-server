class DigiLcdServer < Sinatra::Application
  post '/apps/weather' do
    display_message(get_forecast(params), SPARK, {loop: params[:loop]})
    redirect "/"
  end
end