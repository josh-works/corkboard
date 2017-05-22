FactoryGirl.define do
  factory :user, aliases: [:requester] do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    zipcode Faker::Address.zip_code
    password 'hunter2'
    phone_number Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    roles { [build(:customer)] }

    factory :pro_user, class: Pro, parent: :user do
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      zipcode Faker::Address.zip_code
      phone_number Faker::PhoneNumber.phone_number
      email Faker::Internet.email
      type "Pro"
      roles { [build(:pro), build(:customer)] }
    end
  end
end

FactoryGirl.define do
  factory :listing_with_features, :parent => :listing do |listing|
    features { build_list :feature, 3 }
  end
end
