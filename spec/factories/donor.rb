FactoryGirl.define do
  factory :donor do
    email { Faker::Internet.email }
    password 'password'
    terms 1
    approved 1
    business_name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.phone_number }
    contact_name { Faker::Name.name }
    type_of_donor { ["Restaurant", "Office", "Event Company", "Other"].sample }
    confirmed_at  { Time.now }
    customer_id '2938400937094huifehi79349737'
  end
end
