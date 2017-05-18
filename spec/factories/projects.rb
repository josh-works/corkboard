FactoryGirl.define do
  timelines = ['ASAP',
               'within the week',
               'this month',
               'anytime']

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
