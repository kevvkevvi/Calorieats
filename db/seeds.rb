# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  { username: 'user1', password_digest: '123456', height: '170', weight: '60', age: '20', gender: 'Male', sports_level: 'Active' },
  { username: 'user2', password_digest: '123456', height: '165', weight: '75', age: '28', gender: 'Female', sports_level: 'Seldom' },
]

users.each do |user|
  User.create!(user)
end

markets = [
  {name: 'beef(1lb)', category: 'meat', price: '14.99', calories: '1250'},
  {name: 'lamb(1lb)', category: 'meat', price: '19.99', calories: '1331'},
  {name: 'broccoli(1lb)', category: 'vegetable', price: '2.2', calories: '153'},
  {name: 'carrot(1lb)', category: 'vegetable', price: '0.52', calories: '186'},
  {name: 'milk(1lb)', category: 'dairy', price: '2.65', calories: '677'},
  {name: 'banana(1lb)', category: 'fruit', price: '0.79', calories: '404'},
  {name: 'apple(1lb)', category: 'fruit', price: '2.49', calories: '237'},
]

markets.each do |market|
  Market.create!(market)
end