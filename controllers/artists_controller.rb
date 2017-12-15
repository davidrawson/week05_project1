require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/artist.rb' )


get '/artists' do
  @artists = Artist.find_all
  erb( :"artists/index" )
end
