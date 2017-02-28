require 'rails_helper'

RSpec.describe FoodPickupsController, type: :controller do
  describe 'POST#create' do
    context 'with valid attributes' do
      login_user
      it 'saves food pickup to the database' do
        expect {
          post :create,
          attributes_for(:food_pickup, donor_id: subject.current_donor.id)
        }.to change(FoodPickup, :count).by(1)
      end
      it 'redirects the food pickup creator back home' do
        post :create, attributes_for(:food_pickup,
        donor_id: subject.current_donor.id)
        expect(response).to redirect_to root_path(assigns[:food_pickup])
      end
    end
  end

  describe 'PATCH#update' do
    login_user
    before :each do
      @food_pickup = create(:food_pickup, donor_id: subject.current_donor.id)
    end
    context 'with valid attributes' do
      it 'locates the proper pickup to be edited' do
        patch :update, id: @food_pickup, food_pickup: attributes_for(:food_pickup)
        expect(assigns(:food_pickup)).to eq(@food_pickup)
      end
      it 'changes and updates food pickup attribues' do
        hash = attributes_for(:food_pickup, quantity: 12, description: "Chicken Sandwiches")
        patch :update, id: @food_pickup, hash
        # @food_pickup.reload
        expect(@food_pickup.reload.quantity).to eq(12)
        expect(@food_pickup.reload.description).to eq("Chicken Sandwiches")
      end
    end
  end
end
