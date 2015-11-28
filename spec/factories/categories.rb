FactoryGirl.define do
  factory :category do
    name

    trait :restricted do
      after :build do |category|
          category.roles << Role.find_or_create_by(name: "Restricted")
      end
    end
  end
end
