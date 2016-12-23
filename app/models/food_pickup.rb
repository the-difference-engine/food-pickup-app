class FoodPickup < ApplicationRecord
  has_many :donor_pickups
  has_many :donors, through: :donor_pickups
  has_many :volunteers, through: :volunteer_food_pickups

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

  def check_reoccurring(pickup)
    # pickup_copy = pickup.dup
    s = Rufus::Scheduler.singleton
    n = 1
    if pickup.reoccurrence == 'Yearly'
      s.every '1y' do
        pickup_copy = pickup.dup
        reoccur_pickup = FoodPickup.create(
          picture: pickup_copy.picture,
          quantity: pickup_copy.quantity,
          description: pickup_copy.description,
          start_time: pickup_copy.start_time += n.year,
          end_time: pickup_copy.end_time += n.year,
          location: pickup_copy.location,
          reoccurrence: pickup_copy.reoccurrence,
          approved: true
        )
        DonorPickup.create(
          donor_id: current_donor.id,
          food_pickup_id: reoccur_pickup.id
        )
        n += 1
      end
    elsif pickup.reoccurrence == 'Monthly'
      s.every '1M' do
        pickup_copy = pickup.dup
        reoccur_pickup = FoodPickup.create(
          picture: pickup_copy.picture,
          quantity: pickup_copy.quantity,
          description: pickup_copy.description,
          start_time: pickup_copy.start_time += n.month,
          end_time: pickup_copy.end_time += n.month,
          location: pickup_copy.location,
          reoccurrence: pickup_copy.reoccurrence,
          approved: true
        )
        DonorPickup.create(
          donor_id: current_donor.id,
          food_pickup_id: reoccur_pickup.id
        )
        n += 1
      end
    elsif pickup.reoccurrence == 'Weekly'
      s.every '1w' do
        pickup_copy = pickup.dup
        reoccur_pickup = FoodPickup.create(
          picture: pickup_copy.picture,
          quantity: pickup_copy.quantity,
          description: pickup_copy.description,
          start_time: pickup_copy.start_time += n.week,
          end_time: pickup_copy.end_time += n.week,
          location: pickup_copy.location,
          reoccurrence: pickup_copy.reoccurrence,
          approved: true
        )
        DonorPickup.create(
          donor_id: current_donor.id,
          food_pickup_id: reoccur_pickup.id
        )
        n += 1
      end
    elsif pickup.reoccurrence == 'Daily'
      s.every '1d' do
        pickup_copy = pickup.dup
        reoccur_pickup = FoodPickup.create(
          picture: pickup_copy.picture,
          quantity: pickup_copy.quantity,
          description: pickup_copy.description,
          start_time: pickup_copy.start_time += n.day,
          end_time: pickup_copy.end_time += n.day,
          location: pickup_copy.location,
          reoccurrence: pickup_copy.reoccurrence,
          approved: true
        )
        DonorPickup.create(
          donor_id: current_donor.id,
          food_pickup_id: reoccur_pickup.id
        )
        n += 1
      end
    end
  end
end
