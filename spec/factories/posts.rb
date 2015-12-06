FactoryGirl.define do
  factory :post do
    type ""
    transient do
      user
    end
    transient do
      topic
    end
    content "Awesome reply!"
  end

end
