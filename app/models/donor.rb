class Donor < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :terms, acceptance: true
  validates :business_name, :address, :phone_number, :contact_name, :type_of_donor, presence: true
  has_many :food_pickups
  scope :not_admin, -> { where(admin: false) }

  after_create :set_charge_amount

  private

  def set_charge_amount
    if type_of_donor == 'Office'
      self.charge = 20.00
    elsif type_of_donor == 'Restaurant'
      self.charge = 10.00
    else
      self.charge = 100.00
    end
      self.save
  end

end
