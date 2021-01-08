# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "ariane", email: "fairwoodclean@gmail.com", password: "tweedle")
User.create(name: "test", email: "test@email.com", password: "fakepassword")
Nomination.create(user_id: 1, '1': 'tt0078788', '2': 'tt3385516', '3': 'tt0318627', '4': 'tt1727776', '5': 'tt1673430')