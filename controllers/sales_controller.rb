require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/sale.rb' )


get ('/sales') do
  @sales = Sale.all
  @bestsellers = Sale.bestsellers
  erb( :"sales/index" )
end
#
# get ('/artists/new') do
#   erb( :"artists/new")
# end
#
# post ('/artists') do
#   @artist = Artist.new(params)
#   @artist.save()
#   erb( :"artists/create")
# end
#
# get ('/artists/:id/edit') do
#   @artist = Artist.find( params[:id] )
#   erb( :"artists/edit" )
# end
#
# post ('/artists/:id') do # SHOW
#   Artist.new( params ).update
#   redirect to '/artists'
# end
