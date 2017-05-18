FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    zipcode Faker::Address.zip_code
    phone_number Faker::PhoneNumber.phone_number
    email Faker::Internet.email
  end
end
