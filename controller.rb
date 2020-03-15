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

#dog edit form
get '/dogs/:id/edit' do
  @dog = Dog.find(params['id'])
  @no_owner = Owner.all.first.id.to_i
  erb(:edit_dog)
end

#update dog details
post '/dogs/:id' do
  dog = Dog.new(params)
  dog.update
  redirect to "/dogs/#{params['id']}"
end

#delete a dog
post '/dogs/:id/delete' do
  dog = Dog.find(params['id'])
  dog.delete
  redirect to "/dogs"
end

#show all owners
get '/owners' do
  owners = Owner.all
  @owners = owners.drop(1)
  erb(:index_owners)
end

#add a new owner
get '/owners/new' do
  @owners = Owner.all
  erb(:new_owner)
end
