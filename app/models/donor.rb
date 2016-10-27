class Donor < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :terms, acceptance: true
  validates :business_name, :address, :phone_number, :contact_name, :type_of_donor, presence: true

end
