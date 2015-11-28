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

    trait :has_active_session do
      after :build do |user|
          user.sessions << Session.create(user: user, ip: "localtest")
      end
    end

    trait :restricted do
      after :build do |user|
          user.roles << Role.find_or_create_by(name: "Restricted")
      end
    end
  end
end
