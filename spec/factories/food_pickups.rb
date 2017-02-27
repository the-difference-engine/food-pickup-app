FactoryGirl.define do
  factory :food_pickup do
    donor_id nil
    quantity { rand(100) }
    description { Faker::Lorem.sentence }
    start_time { 1.hours.from_now }
    end_time { 2.hours.from_now }
    location { Faker::Address.street_address }
    reoccurrence { ["None", "Daily", "Weekly", "Monthly", "Yearly"].sample }
    charge 20
  end
end
