# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:

enterprise = Ship.create(
  name: 'USS Enterprise',
  ship_class: 'Galaxy',
  location: "Romulan Star Empire"
)

serenity = Ship.create(
  name: 'Serenity',
  ship_class: 'Firefly',
  location: "Miranda"
)

callister = Ship.create(
  name: 'USS Callister',
  ship_class: 'MegaCruzer',
  location: "Black Mirror Nebula"
)

shippy = Ship.create(
  name: 'Shippy McShipFace',
  ship_class: 'Master Troller',
  location: "Uranus"
)

kris = Member.create(
  first_name: "Kris",
  last_name: "Johnson",
  specialty: "Not Understanding Memes",
  ship: shippy
)

ben = Member.create(
  first_name: "Ben",
  last_name: "Hatfield",
  specialty: "Yodel Laughter",
  ship: shippy
)

ned = Member.create(
  first_name: "Ned",
  last_name: "Lehman",
  specialty: "Camoflauge at Starbucks",
  ship: shippy
)

sarah = Member.create(
  first_name: "Sarah",
  last_name: "Fildes",
  specialty: "CSS",
  ship: serenity
)

gabe = Member.create(
  first_name: "Gabe",
  last_name: "Encarnacion",
  specialty: "Everything",
  ship: serenity
)

zain = Member.create(
  first_name: "Zain",
  last_name: "Jakhar",
  specialty: "Eating Pork",
  ship: serenity
)

chris = Member.create(
  first_name: "Chris",
  last_name: "Smith",
  specialty: "Wedding Diets",
  ship: callister
)

jordan = Member.create(
  first_name: "Jordan",
  last_name: "Chu",
  specialty: "Bad Chinese Food",
  ship: callister
)

kennie = Member.create(
  first_name: "Kennie",
  last_name: "Boulin",
  specialty: "Boosting Morale",
  ship: callister
)

erica = Member.create(
  first_name: "Erica",
  last_name: "Huang",
  specialty: "Multitasking",
  ship: enterprise
)

braden = Member.create(
  first_name: "Braden",
  last_name: "Lawrence",
  specialty: "User Experience",
  ship: enterprise
)

vinh = Member.create(
  first_name: "Vinh",
  last_name: "Doan",
  specialty: "Relaxation Techniques",
  ship: enterprise
)

evan = Member.create(
  first_name: "Evan",
  last_name: "Fernberg",
  specialty: "Coffee Runs",
  ship: enterprise
)
