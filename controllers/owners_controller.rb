require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/dog')
also_reload('../models/*')

get '/owners' do
    @owners = Owner.valid_owners
    erb(:"owners/index")
end

get '/owners/new' do
    @owners = Owner.all
    erb(:"owners/new")
end

post '/owners' do
    Owner.new(params).save
    redirect to '/owners'
end

get '/owners/:id' do
    @owner = Owner.find(params['id'])
    @matches = @owner.match
    @dogs = Dog.all
    @no_owner = Owner.no_owner['id'].to_i
    erb(:"owners/show")
end


get '/owners/:id/edit' do
    @owner = Owner.find(params['id'])
    erb(:"owners/edit")
end


post '/owners/:id' do
    owner = Owner.new(params)
    owner.update
    redirect to "/owners/#{params['id']}"
end               
  

post '/owners/:id/delete' do
    owner = Owner.find(params['id'])
    owner.delete
    redirect to "/owners"
end