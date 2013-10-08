class DigiLcdServer < Sinatra::Application
  get '/message' do
    display_message(params[:message], SPARK)
  end
end