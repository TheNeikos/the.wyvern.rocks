FactoryGirl.define do
  factory :post do
    type ""
    transient do
      user
      topic
    end
    content "Awesome reply!"
  end

end
