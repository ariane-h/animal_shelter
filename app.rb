require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/dogs_controller.rb')
require_relative('controllers/owners_controller.rb')

get '/' do
  erb( :index )
end