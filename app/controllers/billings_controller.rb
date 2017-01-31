class BillingsController < ApplicationController

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :source => params[:stripeToken],
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
