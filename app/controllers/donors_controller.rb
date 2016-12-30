class DonorsController < ApplicationController
  before_action :authenticate_donor!
  skip_before_action :verify_authenticity_token

  def index
    @food_pickups = current_donor.food_pickups
  end

  def admin_index
    @donors = Donor.not_admin
    @approved_pickups = FoodPickup.approved
    @unapproved_pickups = FoodPickup.unapproved
  end

  def new_payment
  end

  def create_customer
    Stripe.api_key = "sk_test_rG4AezyEfV84wVOflssYHgWR"

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      :source => token,
      :description => current_donor.business_name
    )
    if customer
      flash[:success] = "Your credit card was saved successfully."
    else
      flash[:warning] = "Sorry something went wrong."
    end
    redirect_to '/'
  end
end
