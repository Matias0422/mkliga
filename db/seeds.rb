# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: 'leguenta@hotmail.com',password: 'macatuna04', name: "macatuna")
user2 = User.create(email: 'brunomatiascasas@hotmail.com',password: 'macatuna04', type_user: 2, name: "macatuna04")
user1.save
user2.save