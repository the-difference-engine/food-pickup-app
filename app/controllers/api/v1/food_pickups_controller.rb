module Api
  module V1
    class FoodPickupsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        @approved_pickups = FoodPickup.approved
        @unapproved_pickups = FoodPickup.unapproved
      end
    end
  end
end
