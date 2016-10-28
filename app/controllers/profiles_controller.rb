class ProfilesController < ApplicationController
  def index
  end

  def show
    @donor = Donor.find_by(id: params[:id])
  end

  def update
    @donor = Donor.find_by(id: params[:id])
    @donor.update(
    contact_name: params[:contact_name],
    email: params[:email],
    business_name: params[:business_name],
    address: params[:address],
    phone_number: params[:phone_number],
    type_of_donor: params[:type_of_donor],
    approved: true
    )
  end

end
