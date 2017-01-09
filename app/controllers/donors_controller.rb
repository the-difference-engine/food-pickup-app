class DonorsController < ApplicationController
  before_action :authenticate_donor!

  def index
    @food_pickups = current_donor.food_pickups
  end

  def admin_index
    if current_donor.admin == false
      redirect_to '/'
    else
      @donor = Donor.where(approved: false)
      @donors = Donor.not_admin
      @pickup = FoodPickup.find_by(id: params[:id])
      @approved_pickups = FoodPickup.approved
      @unapproved_pickups = FoodPickup.unapproved
    end
  end
end
