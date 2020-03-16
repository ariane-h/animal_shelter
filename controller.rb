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
  @no_owner = Owner.no_owner['id'].to_i
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
  @owners = Owner.all
  @no_owner = Owner.no_owner['id'].to_i
  erb(:show_dog)
end

#dog edit form
get '/dogs/:id/edit' do
  @dog = Dog.find(params['id'])
  @no_owner = Owner.no_owner['id'].to_i
  @owners = Owner.all
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
  @owners = Owner.valid_owners
  erb(:index_owners)
end

#add a new owner
get '/owners/new' do
  @owners = Owner.all
  erb(:new_owner)
end

#update the owners table
post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

#show owner profile
get '/owners/:id' do
  @owner = Owner.find(params['id'])
  @dogs = Dog.all
  erb(:show_owner)
end

#owner edit form
get '/owners/:id/edit' do
  @owner = Owner.find(params['id'])
  erb(:edit_owner)
end

#update owner details
post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end

#delete an owner
post '/owners/:id/delete' do
  owner = Owner.find(params['id'])
  owner.delete
  redirect to "/owners"
end

####
