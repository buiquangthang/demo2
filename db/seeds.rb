User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do
  cat = Category.create!(name: Faker::App.name,
                   picture: Faker::Avatar.image)
  10.times do
    ques = Question.create(content: Faker::App.name, category_id: cat.id)
    4.times do |n|
      if n == 3
        Answer.create!(content: Faker::App.name, is_correct: true, question_id: ques.id)
      else
        Answer.create!(content: Faker::App.name, is_correct: false, question_id: ques.id)
      end
    end
  end
end


# Following relationships
users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each do |followed| 
  user.follow(followed)
  Activity.create!(action: 1, source: followed.id, user_id: user.id)
end
followers.each do |follower| 
  follower.follow(user)
  Activity.create(action: 1, source: user.id, user_id: follower.id)
end
# Create comment