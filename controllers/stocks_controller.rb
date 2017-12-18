require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/stock.rb' )

get ('/stocks') do
  @stocks = Stock.all()
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
