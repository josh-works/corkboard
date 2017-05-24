FactoryGirl.define do

  factory :project do
    status 0
    zipcode { Faker::Address.zip_code }
    recurring { Faker::Boolean.boolean }
    timeline 0
    description { Faker::Hipster.paragraph(2) }
    requester
    service
  end
  
end
