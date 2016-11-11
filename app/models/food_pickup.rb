class FoodPickup < ApplicationRecord
  has_many :donor_pickups
  has_many :donors, through: :donor_pickups

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
end
