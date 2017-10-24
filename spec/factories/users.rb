FactoryGirl.define do
  factory :user do
    email {'vr100@gmail.com'}
    password '12345678'
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
  end
end
