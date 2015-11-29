FactoryGirl.define do
  factory :category do
    name

    trait :restricted do
      after :build do |category|
          category.roles << Role.find_or_create_by(name: "Restricted")
      end
    end

    trait :with_topics do
      after(:create) do |category|
        5.times do
          category.topics << create(:topic)
        end
      end
    end
  end
end
