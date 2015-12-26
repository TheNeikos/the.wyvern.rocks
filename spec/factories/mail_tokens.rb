FactoryGirl.define do
  factory :mail_token do
    user
    token do
      SecureRandom.hex 32
    end
  end

end
