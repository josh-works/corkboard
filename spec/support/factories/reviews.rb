FactoryGirl.define do
  factory :review do
    user
    pro
    service 
    body "Baseball's like the boy version of softball"
    rating {rand(1..5)}
  end
end
