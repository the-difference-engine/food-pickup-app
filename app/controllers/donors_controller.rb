class DonorsController < ApplicationController
  before_action :authenticate_donor!
  def index
    @food_pickups = current_donor.food_pickups
  end

  def admin_index
    @donors = Donor.not_admin
    @approved_pickups = FoodPickup.approved
    @unapproved_pickups = FoodPickup.unapproved
  end
end
