FactoryGirl.define do
  factory :bid do
    pro
    project
    amount "100"
    comment "I'd like to work on this project."
    status 0
  end
end
