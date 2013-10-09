class DigiLcdServer < Sinatra::Application
  post '/apps/stocks' do
    if params[:stocks].nil?
      display_message("No stocks requested. Please specify stocks.", SPARK, {loop: params[:loop]})
    else
      display_message(get_stock_data(params[:stocks].split(",")), SPARK, {loop: params[:loop]})
    end
    redirect "/"
  end
end