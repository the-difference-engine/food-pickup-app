class FoodPickupsController < ApplicationController
before_action :authenticate_donor!

  def new
    @food_pickup = FoodPickup.new
  end

  def create
    @food_pickup = FoodPickup.create(
      picture: params[:picture],
      quantity: params[:quantity],
      description: params[:description],
      start_time: params[:start_time],
      end_time: params[:end_time]
    )
    if @food_pickup.valid?
      DonorPickup.create(
        donor_id: current_donor.id,
        food_pickup_id: @food_pickup.id
      )
      redirect_to '/'
      flash[:success] = "The pickup was successfully created"
    else
      flash[:danger] = @food_pickup.errors.full_messages
      render "new"
    end
  end
end
