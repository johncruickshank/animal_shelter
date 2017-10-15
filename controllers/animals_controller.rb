require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
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

post '/animals/:id/delete' do
  Animal.destroy(params[:id])
  redirect to("/animals")
end
