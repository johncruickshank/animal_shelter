require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')

get '/animals' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb (:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all()
  erb(:"animals/new")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to("/animals")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params['id'])
  erb(:"animals/edit")
end

get '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update()
  redirect to ("/animals")
end

post '/animals/:id/delete' do
  Animal.destroy(params[:id])
  redirect to("/animals")
end

get '/find_type' do
  @animals = Animal.find_type(params[:type])
  @owners = Owner.all()
  erb (:"animals/index")
end

get '/find_breed' do
  @animals = Animal.find_breed(params[:breed])
  @owners = Owner.all()
  erb (:"animals/index")
end

get '/find_adopt' do
  # evaluate params adoptable and make it false if it isn't true
  @adoptable = params[:adoptable] ? true:false
  @animals = Animal.only_adopt(@adoptable)
  @owners = Owner.all()
erb (:"animals/index")
end
