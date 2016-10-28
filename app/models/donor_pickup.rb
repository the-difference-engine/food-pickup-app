class DonorPickup < ApplicationRecord
belongs_to :donor
belongs_to :food_pickup
end
