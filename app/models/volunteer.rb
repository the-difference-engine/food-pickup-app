class Volunteer < ApplicationRecord
  has_many :food_pickups, through: :volunteer_food_pickups
end
