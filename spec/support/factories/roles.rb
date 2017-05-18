FactoryGirl.define do

  factory :admin, class: Role do
    name 'admin'
  end

  factory :pro, class: Role do
    name 'pro'
  end

  factory :customer, class: Role do
    name 'customer'
  end

end
