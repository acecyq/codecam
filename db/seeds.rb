# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user1 = User.create!(:email => 'sabrina0@gmail.com', :password => '123456')
# user2 = User.create!(:email => 'sabrina1@gmail.com', :password => '123456')
# user3 = User.create!(:email => 'sabrina2@gmail.com', :password => '123456')
# user4 = User.create!(:email => 'sabrina3@gmail.com', :password => '123456')
# user5 = User.create!(:email => 'sabrina4@gmail.com', :password => '123456')
# user6 = User.create!(:email => 'sabrina5@gmail.com', :password => '123456')

user1 = User.find(1)
user2 = User.find(2)

room1 = Room.create!(user1: user1, user2: user2)
# Room.create!(user1: user1, user2: user2)
# Room.create!(user1: user1, user2: user2)
# Room.create!(user1: user1, user2: user2)
# Room.create!(user1: user1, user2: user2)


Message.create!(user: user1, room: room1, content: "shit yay")
Message.create!(user: user2, room: room1, content: "shit yay2")
Message.create!(user: user1, room: room1, content: "shit yay3")
Message.create!(user: user2, room: room1, content: "shit yay4")
Message.create!(user: user1, room: room1, content: "shit yay5")