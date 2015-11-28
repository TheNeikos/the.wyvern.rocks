FactoryGirl.define do
  factory :topic do
    sequence :name do |n|
      "Topic #{n}"
    end
    user

    after(:build) do |topic|
      topic.category = Category.find_or_create_by(name: "General")
    end
  end


end
