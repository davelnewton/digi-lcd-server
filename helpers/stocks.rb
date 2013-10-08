def get_stock_data(symbols)
  stock_data = []
  symbols.each do |stock|
    quote = StockQuote::Stock.quote(stock)
    if quote.response_code == 200
      stock_data.push "#{quote.pretty_symbol}: #{quote.company} H: #{quote.high} L: #{quote.high} Last: #{quote.last}"
    else
      stock_data.push "No data for #{params[:stock]}. "
    end
  end
  stock_data.join(" ")
end