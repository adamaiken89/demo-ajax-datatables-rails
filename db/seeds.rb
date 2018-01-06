# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ITERATION = 10_000
require 'faker'
random_count = ((1..100).to_a)
users = []
ITERATION.times do |i|
  users << User.new(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    age: random_count.sample,
    job: Faker::Job.title,
    company: Faker::Company.name,
  )
end
User.import users, batch_size: 1_000
