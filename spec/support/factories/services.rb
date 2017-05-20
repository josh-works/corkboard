FactoryGirl.define do
  factory :service do
    name "Mowing"
    category
    slug { name.parameterize }
  end
end
