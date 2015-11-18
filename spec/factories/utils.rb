FactoryGirl.define do
  sequence :name do |n|
    "Flutter Shy Fan ##{n}"
  end

  sequence :email do |n|
    "flutters#{n}@shy.eu"
  end
end
