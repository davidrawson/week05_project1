require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all')
require_relative( '../models/sale.rb' )


get ('/sales') do
  @sales = Sale.all
  @bestsellers = Sale.bestsellers
  erb( :"sales/index" )
end
