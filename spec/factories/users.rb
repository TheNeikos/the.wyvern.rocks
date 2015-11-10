FactoryGirl.define do
  factory :user do
    name "Flutter Shy"
    email "flutters@shy.eu"
    password "I have a Bunny!"
    password_confirmation "I have a Bunny!"
    is_banned false
  end
end
