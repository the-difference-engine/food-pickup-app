module Api
  module V1
    class ProfilesController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        @unapproved_donors = Donor.where(approved: false, admin: false)
        @approved_donors = Donor.where(approved: true, admin: false)
      end

      def update
        @donor = Donor.find_by(id: params[:id])
        if params[:approved] == 1
          @donor.update(approved: true)
          render json: {success: "Approved!"}
        else
          @donor.update(approved: false)
          render json: {success: "Pending!"}
        end
      end
    end
  end
end
