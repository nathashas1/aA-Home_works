# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
amador = House.create(address:'7913 s lake')

sasha = Person.create(name:"sasha",house_id:amador.id)
pri = Person.create(name:"pri",house_id:amador.id)
nainu = Person.create(name:"nainu",house_id:amador.id)
