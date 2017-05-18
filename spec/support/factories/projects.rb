FactoryGirl.define do
  timelines = ['ASAP',
               'Sometime This Week',
               'In 2 to 4 Weeks',
               'No deadline']

  sequence :timeline, timelines.cycle do |n|
    "#{n}"
  end

  factory :project do
    status 0
    zipcode Faker::Address.zip_code
    recurring Faker::Boolean.boolean
    timeline { generate(:timeline) }
    description Faker::Hipster.paragraph(2)
  end
end
