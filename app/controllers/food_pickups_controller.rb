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
          end_time: params[:end_time],
          location: params[:location],
          reoccurrence: params[:reoccurrence],
          charge: params[:number],
          donor_id: current_donor.id
        )

      if @food_pickup.valid?
        redirect_to '/'
        flash[:success] = "The pickup was successfully created"
      else
        flash[:danger] = @food_pickup.errors.full_messages
        render "new"
      end
      @food_pickup.check_reoccurring(@food_pickup)
  end

  def show
    @food_pickup = FoodPickup.find_by(id: params[:id])
  end

  def edit
    @food_pickup = FoodPickup.find_by(id: params[:id])
  end

  def update
    if current_donor.admin?
      @food_pickup = FoodPickup.update(
        approved: params[:approved],
        quantity: params[:quantity],
        description: params[:description],
        start_time: params[:start_time],
        end_time: params[:end_time],
        location: params[:location],
        reoccurrence: params[:reoccurrence],
        charge: params[:number]
      )
    end
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
end

private

def food_pickup_params
  params.permit(:reoccurrence)
end
