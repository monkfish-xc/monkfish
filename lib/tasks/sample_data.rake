namespace :db do
	desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "adam@testing.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    5.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@testing.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  desc "Fill database with sample data"
  task populate: :environment do
    users = User.all(limit: 5)
    10.times do
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.posts.create!(title: title, content: content) }
    end
  end
end
