
json.approved do
  json.array! @approved_pickups.each do |pickup|
    json.business_name pickup.donor.business_name
    json.contact_name pickup.donor.contact_name
    json.approved pickup.approved
    json.pickup_id pickup.id
    json.created_at pickup.created_at
    json.start_time pickup.start_time
    json.end_time pickup.end_time
    json.quantity pickup.quantity
    json.description pickup.description
    json.location pickup.location
    json.picture pickup.picture
  end
end
json.unapproved do
  json.array! @unapproved_pickups.each do |pickup|

      json.business_name pickup.donor.business_name
      json.contact_name pickup.donor.contact_name
      json.approved pickup.approved
      json.pickup_id pickup.id
      json.created_at pickup.created_at
      json.start_time pickup.start_time
      json.end_time pickup.end_time
      json.quantity pickup.quantity
      json.description pickup.description
      json.location pickup.location
      json.picture pickup.picture
    end
end
