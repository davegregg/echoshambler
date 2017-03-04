# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

17.times do
  fake_user = User.new({
    username:  FFaker::Internet.user_name,
    email:     FFaker::Internet.email,
    fullname:  FFaker::Name.name,
    photo_url: FFaker::Avatar.image,
    password:  FFaker::Internet.password[0...72]
  })
  fake_user.save!

  rand(23).times do
    Grunt.new({
      user: fake_user,
      body: FFaker::Tweet.tweet[0...160],
    }).save!
  end
end
