FactoryGirl.define do
  factory :industry do
    name "Home"
    slug {"#{name.parameterize}"}
  end
end
