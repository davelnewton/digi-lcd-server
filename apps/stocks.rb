class DigiLcdServer < Sinatra::Application
  get '/apps/stocks' do
    if params[:stocks].nil?
      display_message("No stocks requested. Please specify stocks.", SPARK, {loop: params[:loop]})
    else
      display_message(get_stock_data(params[:stocks].split(",")), SPARK, {loop: params[:loop]})
    end
    "Message displayed successfully."
  end
end