require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

get '/' do
  redirect '/starships'
end

get '/starships' do
  @ships = Ship.all
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.

  erb :'starships/index'
end

get '/crew-members' do
  @members = Member.order(:last_name)
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.

  erb :'members/index'
end

get '/starships/new' do
  erb :'starships/new'
end

post '/starships/new' do
  @name = params["name"]
  @ship_class = params["ship_class"]
  @location = params["location"]

  starship = Ship.new(
    name: @name,
    ship_class: @ship_class,
    location: @location
  )
  id = Ship.last.id

  if starship.save
    flash[:notice] = 'New Starship was successfully created.'
    redirect "/starships/#{id}"
  else
    flash.now[:notice] = starship.errors.full_messages.to_sentence
    erb :'/starships/new'
  end
end

post '/crew-members' do
  @first_name = params["first_name"]
  @last_name = params["last_name"]
  @specialty = params["specialty"]
  @ship = Ship.find(params["ship"])

  member = Member.new(
    first_name: @first_name,
    last_name: @last_name,
    specialty: @specialty,
    ship: @ship
  )

  if member.save
    flash[:notice] = 'New crew member was successfully created.'
    redirect "/crew-members"
  else
    flash.now[:notice] = member.errors.full_messages.to_sentence
    erb :'starships/show'
  end
end

get '/starships/:id' do
  @ship = Ship.find(params["id"])
  erb :'starships/show'
end
