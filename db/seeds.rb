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

Category.create title: "Drinks"
Category.create title: "Bikes"
Category.create title: "Clothing"

Item.create name: 'Socks', description: 'Gives you traction', img_url: 'http://www.rastaempire.com/images/Product/medium/4214-cannabis-ankle-socks-brngreen.jpg',
price: 10.99, quantity: 10, category:Category.find(3)

Item.create name: 'beer', description: 'Gives you wings', img_url: 'http://images.huffingtonpost.com/2016-01-26-1453821995-8643361-beermain.jpg',
price: 7.99, quantity: 10, category:Category.find(1)

Item.create name: 'mountain bike', description: 'Gives you wings', img_url: 'http://comparecamp.com/media/uploads/2014/09/bike.jpg',
price: 250.72, quantity: 10, category:Category.find(2)

Item.create name: 'kanye', description: 'genius', img_url: 'http://www.therwandan.com/ki/wp-content/uploads/sites/3/2016/02/Kanye-West.jpg', price: 0.99
