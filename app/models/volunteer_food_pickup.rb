class VolunteerFoodPickup < ApplicationRecord
  belongs_to :volunteer
  belongs_to :food_pickup
end
