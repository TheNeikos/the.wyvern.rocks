FactoryGirl.define do
  factory :topic do
    sequence :name do |n|
      "Topic #{n}"
    end
    transient do
      user
    end

    after(:build) do |topic|
      topic.category = Category.find_or_create_by(name: "General")
    end

    trait :restricted do
      after(:build) do |topic|
        topic.category.roles << Role.find_or_create_by(name: "Restricted")
      end
    end
    trait :with_topics do
      after(:create) do |topic|
        5.times do
          topic.posts << create(:post, )
        end
      end
    end
  end
end
