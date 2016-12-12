if @admin
  json.array! @shelters.each do |shelter|
      json.id shelter.id
      json.name shelter.name
      json.address shelter.address
      json.phone_number shelter.phone_number
      json.email shelter.email
  end
end
