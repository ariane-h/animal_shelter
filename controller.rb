require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/dog')
also_reload('./models/*')

get '/dogs' do
  @dogs = Dog.all
  erb(:index_dogs)
end

get '/dogs/new' do
  @dogs = Dog.all
  erb(:new_dog)
end

get '/owners' do
  owners = Owner.all
  @owners = owners.drop(1)
  erb(:index_owners)
end
