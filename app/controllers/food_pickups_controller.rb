class FoodPickupsController < ApplicationController
before_action :authenticate_donor!
before_action :authorize_admin!, only: :admin_update
before_action :verify_customer_id, only: [:new, :create]

  def new
    params[:id].present? ? @food_pickup = FoodPickup.find(params[:id]) : @food_pickup = FoodPickup.new(start_time: Time.current, end_time: Time.current + 1.hour)
  end

  def create
    @food_pickup = FoodPickup.create(
      donor_id: current_donor.id,
      picture: params[:picture],
      quantity: params[:quantity],
      description: params[:description],
      start_time: params[:start_time],
      end_time: params[:end_time],
      location: params[:location],
      reoccurrence: params[:reoccurrence],
      charge: params[:charge]
    )
    if @food_pickup.valid?
      flash[:success] = 'The pickup was successfully created'
      redirect_to '/'
    else
      flash[:danger] = @food_pickup.errors.full_messages
      render 'new'
    end
  end

  def show
    @food_pickup = FoodPickup.find_by(id: params[:id])
  end

  def edit
    @food_pickup = FoodPickup.find_by(id: params[:id])
    @form_path = current_donor.admin? ? admin_update_food_pickup_path(@food_pickup.id) : edit_food_pickup_path(@food_pickup.id)
  end

  def update
    @food_pickup = FoodPickup.find_by(id: params[:id])
    @food_pickup.update(food_pickup_params)
    redirect_to '/'
  end

  def agreement
    @time = Time.now
  end

  def generate_pdf
    @time = Time.now
    @sign = params[:signature]
    html = render_to_string(action: :agreement, layout: 'agreement.html.erb')
    pdf = WickedPdf.new.pdf_from_string(html)
    AgreementMailer.send_agreement(pdf, current_donor).deliver_now

    if @sign.length != 0
      flash[:success] = "Please check your email for a signed copy of the agreement."
      redirect_to '/'
    else
      flash[:danger] = "Please sign form and submit it again."
      render 'agreement'
    end
  end

  def admin_update
    @food_pickup = FoodPickup.find_by(id: params[:id])
    @food_pickup.update(admin_food_pickup_params)

    @stripe_charge = (@food_pickup.charge.to_i * 100)
    if @food_pickup.approved? && @food_pickup.donor.customer_id.present?
      @food_pickup.check_reoccurring(@food_pickup)
      begin
        Stripe::Charge.create(
          customer: @food_pickup.donor.customer_id,
          amount: @stripe_charge,
          description: 'Rails Stripe customer',
          currency: 'usd'
        )
        @food_pickup.update(paid: true)
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to edit_food_pickup_path(@food_pickup.id) && return
      end
      flash[:success] = "The food pickup was successfully charged!"
    else
      flash[:success] = "The food pickup was successfully updated!"
    end
    redirect_to admin_path
  end

  private

  def food_pickup_params
    params.permit(update_params)
  end

  def admin_food_pickup_params
    params.permit(update_params << %i(charge approved))
  end

  def update_params
    %i(reoccurrence picture quantity description start_time end_time location)
  end

  def verify_customer_id
    if current_donor.customer_id.blank?
      flash[:warning] = "Sorry, you dont have a credit card on file."
      redirect_to new_billing_path
    end
  end
end
