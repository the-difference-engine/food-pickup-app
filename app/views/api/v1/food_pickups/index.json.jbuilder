json.approved @donor_pickups.each do |relation|
  if relation.food_pickup.approved
    json.business_name relation.donor.business_name
    json.contact_name relation.donor.contact_name
    json.approved relation.food_pickup.approved
    json.pickup_id relation.food_pickup.id
    json.created_at relation.food_pickup.created_at
    json.start_time relation.food_pickup.start_time
    json.end_time relation.food_pickup.end_time
    json.quantity relation.food_pickup.quantity
    json.description relation.food_pickup.description
    json.location relation.food_pickup.location
    json.picture relation.food_pickup.picture
  end
end
json.unapproved @donor_pickups.each do |relation|
  if !relation.food_pickup.approved
    json.unapproved
        json.business_name relation.donor.business_name
        json.contact_name relation.donor.contact_name
        json.approved relation.food_pickup.approved
        json.pickup_id relation.food_pickup.id
        json.created_at relation.food_pickup.created_at
        json.start_time relation.food_pickup.start_time
        json.end_time relation.food_pickup.end_time
        json.quantity relation.food_pickup.quantity
        json.description relation.food_pickup.description
        json.location relation.food_pickup.location
        json.picture relation.food_pickup.picture
  end
end
