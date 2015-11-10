FactoryGirl.define do
  factory :user do |n|
    name
    email
    password "I have a Bunny!"
    password_confirmation "I have a Bunny!"
    is_banned false

    after(:build) do |user|
      user.roles << Role.find_or_create_by(name: "User")
    end
  end
end
