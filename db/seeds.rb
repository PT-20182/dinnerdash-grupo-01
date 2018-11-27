# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "Massa", quantity: 0)
Category.create(name: "Frios", quantity: 0)
User.create(name: "admin" , email:"admin@example.com" , password:"noonecanguessthispass",
             password_confirmation: "noonecanguessthispass", admin: true)