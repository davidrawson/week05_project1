require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/stock.rb' )
require_relative( '../models/album.rb' )

get ('/stocks') do
  @stocks = Stock.all()
  @albums = Album.all()
  erb ( :"stocks/index" )
end

get ('/stocks/new') do
  @artists = Artist.all
  @albums = Album.all
  erb ( :"stocks/new")
end

post ('/stocks') do
  @stocks = Stock.new(params)
  @stocks.save()
  erb ( :"stocks/create")
end

get ('/stocks/:id/edit') do
  @stock = Stock.find( params[:id] )
  erb( :"stocks/edit" )
end

post ('/stocks/:id') do
  # binding.pry
  Stock.new( params ).update
  redirect to '/stocks'
end

post ('/stocks/:id/sell_item') do
  # binding.pry
  stock = Stock.find( params[:id] )
  stock.sell_item
  redirect to '/stocks'
end
