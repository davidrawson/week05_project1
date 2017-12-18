require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/artist.rb' )


get ('/artists') do
  @artists = Artist.all
  erb( :"artists/index" )
end

get ('/artists/new') do
  erb( :"artists/new")
end

post ('/artists') do
  @artist = Artist.new(params)
  @artist.save()
  erb( :"artists/create")
end
