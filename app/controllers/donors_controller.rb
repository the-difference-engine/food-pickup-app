class DonorsController < ApplicationController
  before_action :authenticate_donor!
  def index
    @donor = current_donor
    @food_pickups = @donor.food_pickups.all
  end


end
