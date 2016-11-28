class DonorPickup < ApplicationRecord
  belongs_to :donor
  belongs_to :food_pickup
  scope :not_donor, -> (donor){ where.not(donor_id: donor.id) }
end
