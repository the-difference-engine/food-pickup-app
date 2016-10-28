class Donor < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :terms, acceptance: true
  validates :business_name, :address, :phone_number, :contact_name, :type_of_donor, presence: true
  has_many :donor_pickups
  has_many :food_pickups, through: :donor_pickups

end
