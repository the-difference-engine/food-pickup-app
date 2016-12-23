class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.create(
      name: params[:name],
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      phone_number: params[:phone_number],
      email: params[:email]
    )
    redirect_to 'index'
  end

  def index
    @volunteers = Volunteer.all
  end

  def edit
    @volunteer = Volunteer.find_by(id: params[:id])
  end

  def update
    @volunteer = Volunteer.find_by(id: params[:id])
    @volunteer.update(
      name: params[:name],
      street: params[:street],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      phone_number: params[:phone_number],
      email: params[:email]
    )
    redirect_to '/volunteers'
  end

  def archive
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end
