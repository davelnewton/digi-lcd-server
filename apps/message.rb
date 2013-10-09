class DigiLcdServer < Sinatra::Application
  post '/message' do
    display_message(params[:message], SPARK)
    redirect "/"
  end
end