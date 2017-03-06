# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

19.times do
  fake_user = User.new({
    username:  FFaker::Internet.user_name,
    email:     FFaker::Internet.email,
    fullname:  FFaker::Name.name,
    photo_url: FFaker::Avatar.image,
    password:  FFaker::Internet.password[0...72]
  })
  fake_user.save!

  rand(11).times do
    Grunt.new({
      user: fake_user,
      body: FFaker::Tweet.tweet[0...160],
    }).save!
  end
end

User.all.each do |creeping_user|
  user_pool = [*User.all] - [creeping_user]
  rand(User.count - 1).times do
    creeped_on_user = user_pool.sample
    user_pool -= [creeped_on_user]
    creeping_user.creep!(creeped_on_user)
    creeping_user.creepees_count += 1
    creeped_on_user.creepers_count += 1
  end
end
