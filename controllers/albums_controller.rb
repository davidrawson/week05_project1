require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/album.rb' )
# require_relative( '../models/stock.rb' )


get ('/albums') do
  # @stocks = Stock.all
  @albums = Album.all
  erb ( :"albums/index")
end

get ('/albums/new') do
  @artists = Artist.all
  erb (:"albums/new")
end

post ('/albums') do
  @album = Album.new(params)
  @album.save()
  erb(:"albums/create")
end
