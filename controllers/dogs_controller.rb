require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/owner')
require_relative('../models/dog')

get '/dogs' do
    @dogs = Dog.all
    erb(:"dogs/index")
end

get '/dogs/new' do
    @dogs = Dog.all
    @no_owner = Owner.no_owner['id'].to_i
    erb(:"dogs/new")
end

post '/dogs' do
    Dog.new(params).save
    redirect to '/dogs'
end

get '/dogs/:id' do
    @dog = Dog.find(params['id'])
    @owners = Owner.all
    @no_owner = Owner.no_owner['id'].to_i
    erb(:"dogs/show")
end

get '/dogs/:id/edit' do
    @dog = Dog.find(params['id'])
    @no_owner = Owner.no_owner['id'].to_i
    @owners = Owner.all
    erb(:"dogs/edit")
end

post '/dogs/:id' do
    dog = Dog.new(params)
    dog.update
    redirect to "/dogs/#{params['id']}"
end

post '/dogs/:id/delete' do
    dog = Dog.find(params['id'])
    dog.delete
    redirect to "/dogs"
end