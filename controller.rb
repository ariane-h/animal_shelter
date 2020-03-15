require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/dog')
also_reload('./models/*')

#show all dogs
get '/dogs' do
  @dogs = Dog.all
  erb(:index_dogs)
end

#add a new dog
get '/dogs/new' do
  @dogs = Dog.all
  @no_owner = Owner.all.first.id.to_i
  erb(:new_dog)
end

#update the dogs table
post '/dogs' do
  Dog.new(params).save
  redirect to '/dogs'
end

#show dog profile
get '/dogs/:id' do
  @dog = Dog.find(params['id'])
  erb(:show_dog)
end

get '/owners' do
  owners = Owner.all
  @owners = owners.drop(1)
  erb(:index_owners)
end
