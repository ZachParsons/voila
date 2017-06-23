require 'faker'
8.times do
  User.create!(stage_name: Faker::Space.planet + " " + Faker::Space.moon, email: Faker::Internet.safe_email, password: "voila", master: true, master_id: nil)
end

2.times do
  User.create!(stage_name: Faker::Space.planet + " " + Faker::Space.moon, email: Faker::Internet.safe_email, password: "voila", master_id: Faker::Number.between(1, 8))
end

users = User.all

illusions = 10.times.map do
  Illusion.create!(title: Faker::Ancient.titan,
                  url: Faker::Internet.url,
                  intense: Faker::Boolean.boolean,
                  creator: users.sample,
                  approval: Faker::Boolean.boolean)
end
