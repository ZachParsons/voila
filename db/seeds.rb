require 'faker'

15.times do 
	user = User.new(stage_name: Faker::Name.first_name + " " + Faker::Space.planet, password: "password", master: true)
	user.email = Faker::Internet.email(user.stage_name)
	user.save!
end 


# 8.times do
#   User.create!(stage_name: Faker::Space.planet + " " + Faker::Space.moon, email: Faker::Internet.safe_email, password: "voila", master: true, master_id: nil)
# end













# 8.times do
#   User.create!(stage_name: Faker::Space.planet + " " + Faker::Space.moon, email: Faker::Internet.safe_email, password: "voila", master: true, master_id: nil)
# end

# 2.times do
#   User.create!(stage_name: Faker::Space.planet + " " + Faker::Space.moon, email: Faker::Internet.safe_email, password: "voila", master_id: Faker::Number.between(1, 8))
# end

# users = User.all

# illusions = 10.times.map do
#   Illusion.create!(title: Faker::Ancient.titan,
#                   url: Faker::Internet.url,
#                   intense: Faker::Boolean.boolean,
#                   creator: users.sample,
#                   approval: Faker::Boolean.boolean)
# end
