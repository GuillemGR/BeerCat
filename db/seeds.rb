# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat = Cathegory.create(name: 'Alcohol')
Cathegory.create(name: 'Free Alcohol' )
p1 = Product.create(name: 'Birra', cathegory_id: cat.id)

desc1 = Description.create(description: 'Desc es', language: 'es')
desc2 = Description.create(description: 'Desc cat', language: 'cat')
desc3 = Description.create(description: 'Desc en', language: 'en')

p1.descriptions << [desc1, desc2, desc3]