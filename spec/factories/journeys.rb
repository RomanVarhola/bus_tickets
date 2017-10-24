FactoryGirl.define do
	factory :journey do
    count_of_seats		 { 15 }
    place_of_departure { Faker::Address.city}
    date_of_departure  { Faker::Date.forward(23)}
    place_of_arrive    { Faker::Address.city}
    date_of_arrive     { Faker::Date.forward(23)}
  end
end
