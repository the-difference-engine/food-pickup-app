class ProfilesController < ApplicationController
  def index
    @donors = Donor.where(approved: false)
  end

  def show

  end
end
