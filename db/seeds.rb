# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create f_name: 'Zach', l_name: 'Clevenger', email: 'clevenger@email.com', password: 'asdfasdf'

User.create f_name: 'Alex', l_name: 'Anderson', email: 'anderson@email.com', password: 'asdfasdf'
#
User.create f_name: 'Jon', l_name: 'Stults', email: 'stults@email.com', password: 'asdfasdf'
#
# User.create f_name: 'Sean', l_name: 'Brown', email: 'brown@email.com', password: 'asdfasdf'
#
# User.create f_name: 'El', l_name: 'P', email: 'p@email.com', password: 'asdfasdf'

User.create f_name: 'El', l_name: 'P', email: 'p@email.com', password: 'asdfasdf'

#Admin user

User.create f_name: "Admin", l_name: "User", email:"admin@email.com", password:'root', admin:1

Category.create title: "Drinks"
Category.create title: "Bikes"
Category.create title: "Clothing"
Category.create title: "Music"

Item.create name: 'Socks', description: 'Gives you traction', img_url: 'http://www.rastaempire.com/images/Product/medium/4214-cannabis-ankle-socks-brngreen.jpg',
price: 10.99, quantity: 10, category:Category.find(3)

Item.create name: 'Timberlands', description: 'Great for every occasion', img_url: 'https://s-media-cache-ak0.pinimg.com/originals/38/c9/d0/38c9d0e7cf77cd206d3bfe40c77d3d5e.jpg',
price: 180.00, quantity: 100, category:Category.find(3)

Item.create name: 'Beer', description: 'Gives you wings', img_url: 'http://images.huffingtonpost.com/2016-01-26-1453821995-8643361-beermain.jpg',
price: 7.99, quantity: 10, category:Category.find(1)

Item.create name: 'Water', description: 'Refreshing', img_url: 'http://cliparts.co/cliparts/qiB/X7q/qiBX7qLqT.jpg',
price: 1.99, quantity: 10, category:Category.find(1)

Item.create name: 'Mountain Bike', description: 'Gives you wings', img_url: 'http://comparecamp.com/media/uploads/2014/09/bike.jpg',
price: 250.72, quantity: 10, category:Category.find(2)

Item.create name: 'Vintage Bike', description: 'This old bike needs a litte TLC', img_url: 'http://vintagebicyclerestoration.com/vbrsys/wp-content/uploads/2012/09/Schwinn_0139.jpg
',price: 12.65, quantity: 10, category:Category.find(2)

Item.create name: 'Jon', description: 'Tandem Jon', img_url: 'assets/images/jon.jpg',price: 12.65, quantity: 10, category:Category.find(2)

Item.create name: 'kanye', description: 'genius', img_url: 'http://www.therwandan.com/ki/wp-content/uploads/sites/3/2016/02/Kanye-West.jpg', price: 0.99, quantity: 1, category: Category.find(4)

Item.create name: 'Run The Jewels', description: 'RTJ', img_url: 'http://static.stereogum.com/uploads/2015/06/11174227/maxresdefault.jpg', price: 10.99, quantity: 15, category: Category.find(4)

Item.create name: 'Run The Jewels 2', description: 'RTJ 2', img_url: 'http://www.missinfo.tv/wp-content/uploads/2014/09/run-the-jewels-2.jpg', price: 10.99, quantity: 15, category: Category.find(4)

Item.create name: 'Run The Jewels 3', description: 'RTJ 3', img_url: 'https://upload.wikimedia.org/wikipedia/en/9/96/RunTheJewels3.jpg', price: 10.99, quantity: 15, category: Category.find(4)
