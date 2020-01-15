require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

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

  if @name.strip != "" && @ship_class.strip != "" && @location.strip != ""
    Ship.create(
      name: @name,
      ship_class: @ship_class,
      location: @location
    )
    id = Ship.last.id

    flash[:notice] = 'New Starship was successfully created.'
    redirect "/starships/#{id}"
  else
    @errors = "Error!<br>"

    if @name.strip == ""
      @errors += "Please provide a name.<br>"
    end

    if @ship_class.strip == ""
      @errors += "Please provide a class for your ship.<br>"
    end

    if @location.strip == ""
      @errors += "Please provide a location for your ship.<br>"
    end
    erb :'starships/new'
  end
end

post '/crew-members' do
  @first_name = params["first_name"]
  @last_name = params["last_name"]
  @specialty = params["specialty"]
  @ship = Ship.find(params["ship"])

  if @first_name.strip != "" && @last_name.strip != "" && @specialty.strip != ""
    Member.create(
      first_name: @first_name,
      last_name: @last_name,
      specialty: @specialty,
      ship: @ship
    )

    flash[:notice] = 'New crew member was successfully created.'
    redirect "/crew-members"
  else
    @errors = "Error!<br>"

    if @first_name.strip == ""
      @errors += "Please provide a first name.<br>"
    end

    if @last_name.strip == ""
      @errors += "Please provide a last name.<br>"
    end

    if @specialty.strip == ""
      @errors += "Please provide a specialty for your crew member.<br>"
    end
  end
  erb :'starships/show'
end

get '/starships/:id' do
  @ship = Ship.find(params["id"])
  erb :'starships/show'
end
