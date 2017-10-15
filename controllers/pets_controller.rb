require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet')

get '/pets' do
  @pets = Pet.all
  erb ( :"pets/index" )
end

get '/bitings/new' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb(:"pets/new")
end

post '/pets' do
  pet = Pet.new(params)
  pet.save
  redirect to("/pets")
end

post '/pets/:id/delete' do
  Pet.destroy(params[:id])
  redirect to("/pets")
end
