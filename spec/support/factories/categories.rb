FactoryGirl.define do
  factory :category do
    name "Lawncare"
    industry
    slug {"#{name.parameterize}"}
  end
end
