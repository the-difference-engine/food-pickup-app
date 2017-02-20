class DonorsController < ApplicationController
  before_action :authenticate_donor!
  before_action :authorize_admin!, only: [:admin_index]
  before_action :authorize_donor!, only: [:index]


  def index
    @donors_approved = current_donor.food_pickups.where(approved: true)
    @donors_unapproved = current_donor.food_pickups.where(approved: false)
  end

  def admin_index
    @donor = Donor.where(approved: false, admin: false)
    @donors = Donor.not_admin
    @pickup = FoodPickup.find_by(id: params[:id])
    @approved_pickups = FoodPickup.approved
    @unapproved_pickups = FoodPickup.unapproved
    @negotiable_profiles = Donor.where(negotiable: true)
  end

  def negotiate
    @negotiable_profile = Donor.find_by(id: params[:id])
  end

  def update_rate
    negotiable_profile = Donor.find_by(id: params[:id])
    if negotiable_profile.update(
      charge: params[:charge],
      negotiable: false
    )
      flash[:success] = "The rate was updated successfully."
    else
      flash[:danger] = "Something went wrong, please refresh and try again."

    end
    redirect_to '/admin'
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
      current_donor.update(customer_id: customer.id)
      flash[:success] = "Your credit card was saved successfully."
    else
      flash[:warning] = "Sorry something went wrong."
    end
    redirect_to '/'
  end
end
