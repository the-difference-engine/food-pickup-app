class DonorsController < ApplicationController
  before_action :authenticate_donor!

  def index
    @food_pickups = current_donor.food_pickups
    @donors_unapproved_pickups = 0
    @donors_approved_pickups = 0
    @food_pickups.each do |pickup|
      pickup.approved? ? @donors_approved_pickups += 1 : @donors_unapproved_pickups += 1
    end

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

  def new_payment
    @stripe_publishable_key = Rails.application.secrets.stripe_publishable_key
  end

  def create_customer
    Stripe.api_key = Rails.application.secrets.stripe_secret_key
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
