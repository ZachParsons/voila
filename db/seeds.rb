require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

illusions = 10.times.map do
  Illusion.create!(title: Faker::Ancient.titan,
                  url: Faker::Internet.url,
                  intense: Faker::Boolean.boolean,
                  creator_id: Faker::Number.between(1, 6))
end
