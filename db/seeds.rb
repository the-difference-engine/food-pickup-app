donor_types = ["Restaurant", "Office", "Event Company", "Other"]
reoccurrence = ["None", "Daily", "Weekly", "Monthly", "Yearly"]

20.times do
  password = Faker::Internet.password(10, 20)
  donor = Donor.new({
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      business_name: Faker::Company.name,
      address: Faker::Address.street_address,
      phone_number: Faker::PhoneNumber.cell_phone,
      contact_name: Faker::Name.name,
      type_of_donor: donor_types.sample,
      terms: true
  })
  donor.skip_confirmation!
  donor.save
end

Donor.all.each do |donor|
  rand(2..5).times do
    time = Faker::Time.forward(23)
    FoodPickup.create({
      description: Faker::Lorem.sentence,
      quantity: rand(100),
      start_time: time,
      end_time: time + 1.hour,
      location: donor.address,
      donor_id: donor.id,
      reoccurrence: reoccurrence.sample,
      charge: donor.charge
    })
  end
end
