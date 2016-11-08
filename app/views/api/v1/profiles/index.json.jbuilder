json.unapproved @unapproved_donors.each do |donor|
  json.id donor.id
  json.created_at donor.created_at
  json.business_name donor.business_name
  json.type_of_donor donor.type_of_donor
  json.contact_name donor.contact_name
  json.phone_number donor.phone_number
  json.email donor.email
  json.address donor.address
  json.approved donor.approved
end

json.approved @approved_donors.each do |donor|
  json.id donor.id
  json.created_at donor.created_at
  json.business_name donor.business_name
  json.type_of_donor donor.type_of_donor
  json.contact_name donor.contact_name
  json.phone_number donor.phone_number
  json.email donor.email
  json.address donor.address
  json.approved donor.approved
end
