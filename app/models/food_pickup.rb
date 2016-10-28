class FoodPickup < ApplicationRecord
  has_many :donor_pickups
  has_many :donors, through: :donor_pickups
end
