# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat = Cathegory.create(name: 'Rossa')
cat2 = Cathegory.create(name: 'Roja')
cat3 = Cathegory.create(name: 'Negra')
p1 = Product.create(name: 'La Pubilla', producer: 'La Masovera', price: 2.75,image: 'https://lamasovera.cat/wp-content/uploads/2016/05/pubilla.png',cathegory_id: cat.id)
p2 = Product.create(name: 'La Cabalera', producer: 'La Masovera', price: 2.75, image: 'https://localbier.com/media/cache/brewerymini/uploads/empresa/lamasovera.png', cathegory_id: cat2.id)
p3 = Product.create(name: 'Quer Circus', producer: 'Quer Beer', price: 2.40,image: 'http://www.degustaleon.com/uploaded_images/732957216.jpg', cathegory_id: cat3.id)
p4 = Product.create(name: 'Quer Blat', producer: 'Quer Beer', price: 2.90,image: 'https://static3.soloartesanas.es/988-large_default/360.jpg', cathegory_id: cat.id)
p5 = Product.create(name: 'Montseny Mala Vida', producer: 'Cervesa Montseny', price: 2.95,image: 'https://cervesamontseny.cat/wp-content/uploads/2016/05/montseny-Mala-Vida-premi.jpg', cathegory_id: cat3.id)
p6 = Product.create(name: 'Montseny Hivernale', producer: 'Cervesa Montseny', price: 3.35,image: 'https://cervesamontseny.cat/wp-content/uploads/2016/05/montseny-Hivernale-1.jpg', cathegory_id: cat2.id)
p7 = Product.create(name: 'Montseny Estival', producer: 'Cervesa Montseny', price: 2.25, image: 'https://cervesamontseny.cat/wp-content/uploads/2016/05/montseny-Estival-1.jpg', cathegory_id: cat.id)
p8 = Product.create(name: 'Glops Fumada', producer: 'Glops', price: 4.25, image: 'https://cdn.shopify.com/s/files/1/0137/9872/products/Glops_Torrada_grande.jpg?v=1335365542', cathegory_id: cat2.id)
p9 = Product.create(name: 'Moska Rossa', producer: 'Moska', price: 2.30, image: 'http://vinosydestilados.com/206-tm_thickbox_default/cerveza-moska-rossa.jpg', cathegory_id: cat.id)
p10 = Product.create(name: 'Moska Negra', producer: 'Moska', price: 2.30, image: 'http://www.disevil.com/tienda/182-tm_thickbox_default/cerveza-moska-negra.jpg', cathegory_id: cat3.id)

desc1 = Description.create(description: 'La Cabalera es la primera cerveza hecha por La Masovera.\nLa Cabalera es una cerveza Amber Ale de alta fermentación de un collor terroso. El sabor amargo y del lúpulo son generosos. El sabor de carácter marcado y con tonos cítricos la convierte en una experiencia única para quien quiera gozar de una cerveza distinta en un territorio excepcional', language: 'es')
desc2 = Description.create(description: 'La Cabalera és la primera cervesa que fa La Masovera.\nLa Cabalera és una cervesa Amber Ale d’alta fermentació d’un color terrós. L’amargor i el gust de llúpol són generosos.\nEl sabor de caràcter marcat i amb tocs cítrics la converteix en una experiència única per a qui vulgui gaudir d’una cervesa diferent en un territori excepcional.', language: 'cat')
desc3 = Description.create(description: 'La Cabalera is the first beer made by La Masovera.\nLa Cabalera is an Amber Ale, high fermentation, groundish-colored beer. The bitterness and hop\'s flavour are generous.\nIt\'s characteristic taste with citrical touches turns it into a unique experience for anyone who wants to enjoy a different beer in an exceptional land.', language: 'en')

p2.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'La Pubilla es la primera cerveza con trigo del Pallars que hace La Masovera.\nLa Pubilla es una cerveza elaborada a partir de la cosecha de trigo de la Casa Masover de los Masos de Llimiana.\nTiene un ligero punto ácido y un toque de plátano por la levadura especial de las cervezas de trigo. Su baja amargor, la convierten en una cerveza poco lupolizada, a la vista tiene un punto turbio y un final atrevido muy ligero y refrescante', language: 'es')
desc2 = Description.create(description: 'La Pubilla és la primera cervesa amb blat del Pallars que fa La Masovera.\nLa Pubilla és una cervesa elaborada a partir de la collita de blat de Casa Masover dels Masos de Llimiana.\nTé un lleuger punt àcid, i un toc de plàtan pel llevat especial de les cerveses de blat. La seva baixa amargor, fa que sigui una cervesa poc llupolitzada, a la vista té un punt tèrbol i un final atrevit molt lleuger i refrescant.', language: 'cat')
desc3 = Description.create(description: 'La Pubilla is the first beer made with Pallars\' wheat by La Masovera.\nLa Pubilla is a beer elaborated with the wheat from Casa Masover of Masos de Llimiana.\nIt has a slight acid taste, with a banana touch from the special yeast used in wheat beers. It\'s low bitterness turns it into a low hopped beer, with a turbid touch and a very light, refreshing and daring final.', language: 'en')

p1.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Cerveza de un color caramelo oscuro, con una espuma blanca y consistente. Sorprende en su gusto, con toques amargos y un regusto dulce. Se trata de una Indian Pale Ale que no te dejará indiferente.', language: 'es')
desc2 = Description.create(description: 'Cervesa d’un color caramel fosc, amb una escuma blanca i consistent. Sorprèn en el seu gust, amb tocs d’amargor i un retrogust dolç. Es tracta d’una Indian Pale Ale que no et deixa indiferent.', language: 'cat')
desc3 = Description.create(description: 'A beer with a dark caramel color, with consistent white froth. Surprising by its taste, with bitter touches and a sweet aftertaste. It is an Indian Pale Ale that won\'t let you go unnoticed', language: 'en')

p3.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'De un color amarillo lido, turbia por el trigo utilizado y una espuma blanca y persistente. Cerveza fresca con un punto ácido con notas de cereal y un final fresco y refrescante.', language: 'es')
desc2 = Description.create(description: 'De color groc pàl·lid, tèrbola pel blat utilitzat i amb una escuma blanca i persistent. Cervesa fresca i amb aromes florals, amb un punt àcid amb notes de cereal i de final fresc i refrescant.', language: 'cat')
desc3 = Description.create(description: 'With a pale yellow color, turbid by the wheat and with a persistent white froth. Fresh beer with floral aromas, a bit acid with cereal touches and a refreshing final.', language: 'en')

p4.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Cerveza negra de alta graduación robusta, densa y compleja', language: 'es')
desc2 = Description.create(description: 'Cervesa negra d’alta graduació robusta, densa i complexa.', language: 'cat')
desc3 = Description.create(description: 'Strong, dense complex black beer with high alcohol content.', language: 'en')

p5.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Cerveza de alta fermentación elaborada con una receta de invierno, con un toque especiado', language: 'es')
desc2 = Description.create(description: 'Cervesa d’alta fermentació elaborada amb una recepta d’hivern, amb un toc especiat.', language: 'cat')
desc3 = Description.create(description: 'High fermentation beer made with a winter recipe, with a spiced touch', language: 'en')

p6.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Enamórate de la frescor del lúpulo y disfruta de una cerveza ligera', language: 'es')
desc2 = Description.create(description: 'Enamora’t de la frescor del llúpol i gaudeix d’una cervesa lleugera.', language: 'cat')
desc3 = Description.create(description: 'Fall in love with fresh hop and enjoy a light beer', language: 'en')

p7.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Cerveza de color cobre, espuma de color crema poco persistente con pequeñas burbujas, aromas florales, cítricos, frutos secos y madera, sabor equilibrado.', language: 'es')
desc2 = Description.create(description: 'Cerveza de color coure, escuma de color crema poc persistent amb petites bombolles, aromes florals, cítrics, fruits secs i fusta, amb gust equilibrat.', language: 'cat')
desc3 = Description.create(description: 'Copper colored beer, with creamish, low persistent froth with small bubbles, with flower, citric, nuts and wood aromas with a balanced taste.', language: 'en')

p8.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Cerveza de color ámbar claro con reflejos anaranjados', language: 'es')
desc2 = Description.create(description: 'Cervesa de color ambarí clar amb reflexes ataronjats.', language: 'cat')
desc3 = Description.create(description: 'Clear ambarish beer with orange lights.', language: 'en')

p9.descriptions << [desc1, desc2, desc3]

desc1 = Description.create(description: 'Color wenge oscuro y brillante. Opaca debido a su intensidad', language: 'es')
desc2 = Description.create(description: 'Color wengé fosc i brillant. Opaca degut a la seva intensitat.', language: 'cat')
desc3 = Description.create(description: 'Wenge color, dark and shiny. Opaque due to its intensity', language: 'en')

p10.descriptions << [desc1, desc2, desc3]


admin = Admin.create(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
admin.save
user = User.create(email: 'user@user.com', password: '123456', password_confirmation: '123456')
user.save