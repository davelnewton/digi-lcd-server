require 'sinatra'
require 'haml'
require 'digiusb'

require 'geocoder'
require 'forecast_io'
require 'stock_quote'

require './configuration'


SPARK = DigiUSB.sparks.last

class DigiLcdServer < Sinatra::Application
  set :sessions, true
  set :session_secret, 'aneuc945m!#n32'

  get '/' do
    haml :home
  end

end

require_relative 'helpers/init'
require_relative 'apps/init'