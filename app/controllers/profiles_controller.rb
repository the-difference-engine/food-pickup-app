class ProfilesController < ApplicationController
before_action :authorize_admin!


  def index
    @donors = Donor.where(approved: false)
  end

  def show
    @donor = Donor.find_by(id: params[:id])
  end

  def update
    @donor = Donor.find_by(id: params[:id])
    @donor.update(
    approved: true
    )
    redirect_to '/profiles'
  end

end
