FactoryGirl.define do
  factory :user_role do
    user
    association :role, factory: :customer
  end
end
