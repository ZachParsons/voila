require 'faker'

5.times do 
	master = User.new(stage_name: Faker::Name.first_name + " " + Faker::Space.planet, password: "password", master: true)
	master.email = Faker::Internet.email(master.stage_name)
	master.save!
end 

masters = User.where(master: true)

15.times do 
	apprentice = User.new(stage_name: Faker::LordOfTheRings.character + " " + Faker::Name.last_name, password: "password", master: false, a_master: masters.sample)
	apprentice.email = Faker::Internet.email(apprentice.stage_name)
	apprentice.save!
end

apprentices = User.where(master: false)

# add intense tags 
intense_tags = 10.times.map do 
	Tag.create!(name: Faker::Book.genre + " " + ["deathly","David Blaine stuff", "ILLEGAL"])
end 


# add all tags 
either_tags = 10.times.map do 
	Tag.create!(name: Faker::Book.genre + " " + Faker::Lorem.word)
end 

# approved master illusions 
25.times do 
	approved_master_illusion = Illusion.new(title: Faker::Hipster.word + " " + Faker::Space.nasa_space_craft + " " + ["trick","illusion","disappearing act","splitting", "sawing", "death"].sample, creator: masters.sample, approval: true, intense: [true, false].sample)
	approved_master_illusion.url = Faker::Internet.url(approved_master_illusion.title)

	[1,2,3].sample.times do 
		approved_master_illusion.tags << [intense_tags, either_tags].sample
	end

	approved_master_illusion.save!
end 

# unapproved apprentice illusions 
15.times do 
	unapproved_apprentice_illusion = Illusion.new(title: ["cute","super easy","arp","ARP","cool", "idiots guide to"].sample + " " + ["card","sea lion"].sample + " " + ["flip trick","arp","joke","unconvincing illusion"].sample, creator: apprentices.sample, approval: false, intense: false)
	unapproved_apprentice_illusion.url = Faker::Internet.url(unapproved_apprentice_illusion.title)

	[1,2,3].sample.times do 
		unapproved_apprentice_illusion.tags << either_tags
	end

	unapproved_apprentice_illusion.save!
end

# approved apprentice unintense 
10.times do 
	approved_apprentice_illusion = Illusion.new(title: ["cute","super easy","lol","easy","fun"].sample + " " + ["card","bird","pigeon", "sea lion"].sample + " " + ["trick","illusion","trickery"].sample, creator: apprentices.sample, approval: true, intense: false)
	approved_apprentice_illusion.url = Faker::Internet.url(approved_apprentice_illusion.title)

	[1,2,3].sample.times do 
		approved_apprentice_illusion.tags << either_tags
	end

	approved_apprentice_illusion.save!
end


# apprentice stars 
# 25.times 
