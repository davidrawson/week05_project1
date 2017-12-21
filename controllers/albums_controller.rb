require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/album.rb' )
require_relative( '../models/stock.rb' )


get ('/albums') do
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
  Stock.blank_entry(@album.id)
  erb(:"albums/create")
end

get ('/albums/:id/edit') do # edit
  @album = Album.find( params[:id] )
  erb( :"albums/edit" )
end

post ('/albums/:id') do # SHOW
  Album.new( params ).update
  redirect to '/albums'
end
