FactoryGirl.define do
  factory :review do
    user
    pro
    body "Baseball's like the boy version of softball"
    rating 5
  end
end
