namespace :db do
	desc "Fill database with sample users"
  task populate: :environment do
    User.create!(name: "Adam Morganaki",
                 email: "adam@monkfishapp.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    User.create!(name: "Kill Clean",
                 email: "kyle@monkfishapp.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    25.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@testing.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  desc "Fill database with sample posts"
  task populate: :environment do
    users = User.all(limit: 5)
    10.times do
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.posts.create!(title: title, content: content) }
    end
  end

  desc "Fill database with sample relationships"
  task populate: :environment do
    users = User.all
    user = users.first
    followed_users = users[2..20]
    followers      = users[3..15]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end
end
