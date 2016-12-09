module Api
  module V1
    class SheltersController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        @admin = Donor.where(approved: false, admin: true)
        @shelters = Shelter.all
      end

      def create
        @shelter = Shelter.create(
          name: params[:name],
          address: params[:address],
          phone_number: params[:phone_number],
          email: params[:email],
        )
        if @shelter.valid?
          render json: {success: "Shelter was added successfully"}
        else
          render json: {danger: "Please fill in all the information before submitting"}, status: 422
        end
      end

      def update
        @admin = Donor.where(approved: false, admin: true)
      end

      def destroy
        @shelter = Shelter.find_by(id: params[:id])
        if @shelter.destroy
          render json: {success: "Shelter was deleted successfully"}
        else
          render json: {danger: "Something went wrong, please refresh page and try again"}
        end
      end
    end
  end
end
