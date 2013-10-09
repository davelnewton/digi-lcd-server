# DigiLcdServer

I've been having some great fun with my [DigiStump DigiSpark](http://www.amazon.com/gp/product/B00EIANTEC/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00EIANTEC&linkCode=as2&tag=gitpri-20) and the [16x2 LCD screen](http://digistump.com/products/79)! I thought it would be cool to write sort of an interactive API for it in Sinatra. I also included a program to easily parse any message onto a 16x2 display and break it up into 1.5 second "screens" (see ``display.rb`` under the ``/helpers`` dir). 

The API includes "apps", so far for any generic message, stocks, and weather, though I'd like to expand it further!

## Usage

You connect your DigiSpark + LCD and upload the read_script.ino (cribbed from the DigiSpark examples) to your DigiSpark from the DigisparkArduino program.

Start the app by going into this directory and typing

``rackup``

Then go to ``localhost:9292`` to see your options!

## Available Routes, or "Apps"

I'd love to add some more routes/apps to the equation! These are just some basic ones that I thought of.

To try out the functionality without sending requests through a GUI, just hit the home route at ``localhost:9292``

### Stocks

Uses the [stock_quote](https://github.com/tyrauber/stock_quote) gem.

**Route:**

``POST``

``/apps/stocks``

**Parameters:**

``stocks`` - takes a comma-separated list of stock symbols to look up.

``loop`` - if you'd like to loop the output, takes an integer.

**Example:**

``http://localhost:9292/apps/stocks?stocks=TSLA%2C%20LNKD&loop=3``


### Weather

Uses the [forecast-ruby](https://github.com/darkskyapp/forecast-ruby) gem.

**Route:**

``POST``

``/apps/weather``

**Parameters:**

``zip`` - taken as the last element of the route itself. see examples.

``address`` - taken as a query string param, will be used over zip for more accurate report.

``loop`` - if you'd like to loop the output, takes an integer.

**Example:**

``http://localhost:9292/apps/weather/07076``

``http://localhost:9292/apps/weather/07076?address=500%20Humboldt%20St%2C%20Brooklyn%2C%20NY%2011206``

## Message

Displays any generic message.

**Route:**

``POST``

``/message``

**Parameters:**

``message`` - the message to display

**Example:**

``http://localhost:9292/message?message=hello%20world``


## Contributing

Pull requests are welcome! This is a really really young project so basically any feedback, contributed code, or apps are super welcome.
