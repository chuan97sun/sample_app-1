User.create!(name: "Example User",
            email: "example@railstutorial.org",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true
            activated: true,
            activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "user_1#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
30.times do
content = Faker::Lorem.sentence(5)
users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first
following = users[2..20]
followers = users[3..15]
following.each{|followed| user.follow(followed)}
followers.each{|follower| follower.follow(user)}
