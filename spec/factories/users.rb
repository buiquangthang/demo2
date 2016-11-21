FactoryGirl.define do
  factory :user do
    # name  Faker::Name.name
    # email Faker::Internet.email
    name "thang"
    email "buiquangthangit@gmail.com"
    password 'gibberishdotcom'
    password_confirmation 'gibberishdotcom'
    activated true
    activated_at Time.zone.now
  end
end