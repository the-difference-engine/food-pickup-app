class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name, :address, :phone_number, :contact_name, :type_of_donor, :negotiable])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms, :business_name, :address, :phone_number, :contact_name, :type_of_donor])
  end

  def authorize_admin!
     unless current_donor && current_donor.admin?
       flash[:warning]= "You have to be an Admin."
       redirect_to '/'
     end
  end

  def authorize_donor!
     unless current_donor && !current_donor.admin?
       flash[:warning]= "You do not have access to the Donor's Page."
       redirect_to '/admin'
     end
  end

  def after_sign_in_path_for(resource)
    if current_donor.admin?
      admin_path
    elsif current_donor.sign_in_count == 1
      new_billing_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    "https://rlc-qa.herokuapp.com/donors/sign_in"
  end

end
