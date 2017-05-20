FactoryGirl.define do
  factory :industry do
    name "Home"
    glyphicon "glyphicon-home"
    slug {"#{name.parameterize}"}
  end
end
