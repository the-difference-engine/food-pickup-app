require 'rails_helper'

RSpec.describe FoodPickupsController, type: :controller do

  context 'with valid attributes' do
  login_user
    it 'saves foodpickup to the database' do
      donor = subject.current_donor #This gives us the instance of the login_user
      expect{
        post :create,
        food_pickup: attributes_for(:food_pickup, donor_id: donor.id) #here we set the logged_in users id: as the donor_id for the food_pickup.
      }.to change(FoodPickup, :count).by(1)
    end
  end
end
