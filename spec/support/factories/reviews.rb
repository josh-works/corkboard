FactoryGirl.define do
  factory :reviews do
    user
    pro_user
    body "Baseball's like the boy version of softball"
    rating rand(1..5)
  end
end
