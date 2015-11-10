FactoryGirl.define do
  factory :role do
    name "User"
    factory :role_root do
      name "Root"
    end

    factory :role_banned do
      name "Banned"
    end

    factory :role_unregistered do
      name "Unregistered"
    end
  end
end
