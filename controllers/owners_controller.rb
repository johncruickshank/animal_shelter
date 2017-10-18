require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  @owners = Owner.all()
  erb(:"owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect to("/owners")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  @owner = Owner.new(params)
  @owner.update()
  redirect to ("/owners")
end

post '/owners/:id/delete' do
  @pets = Pet.all()
  @owner = Owner.new(params)
  for pet in @pets
    if pet.owner_id == @owner.id
      redirect to("/owners")
    end
  end
  Owner.destroy(params[:id])
  redirect to("/owners")
end
