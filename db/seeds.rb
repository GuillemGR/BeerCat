# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat = Cathegory.create(name: 'Rosses')
cat2 = Cathegory.create(name: 'Roja')
cat3 = Cathegory.create(name: 'Negra')
p1 = Product.create(name: 'Pubilla', producer: 'La Masovera', image: 'https://lamasovera.cat/wp-content/uploads/2016/05/pubilla.png',alcohol: true,cathegory_id: cat.id)
p2 = Product.create(name: 'Cabalera', producer: 'La Masovera', image: 'https://localbier.com/media/cache/brewerymini/uploads/empresa/lamasovera.png' , alcohol: true, cathegory_id: cat2.id)
p3 = Product.create(name: 'Circus', producer: 'Quer Beer', image: 'http://www.degustaleon.com/uploaded_images/732957216.jpg', alcohol: false, cathegory_id: cat3.id)

desc1 = Description.create(description: 'Desc es', language: 'es')
desc2 = Description.create(description: 'Desc cat', language: 'cat')
desc3 = Description.create(description: 'Desc en', language: 'en')

p1.descriptions << [desc1, desc2, desc3]