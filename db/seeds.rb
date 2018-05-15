# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

español = Language.create(code:'es', name: 'Español')
Language.create(code:'cat', name: 'Catala')
Language.create(code:'en', name: 'English')
p1 = Product.create(name: 'Birra')
Description.create(product: p1, language: español, description: 'ES DESC')
