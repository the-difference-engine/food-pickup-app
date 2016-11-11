class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name, :address, :phone_number, :contact_name, :type_of_donor])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms, :business_name, :address, :phone_number, :contact_name, :type_of_donor])
  end

  def authorize_admin!
     unless current_donor && current_donor.admin
       flash[:warning]= "You have to be an Admin."
       redirect_to '/'
     end
  end

  def after_sign_in_path_for(resource)
    return profiles_path if resource.admin
    return root_path if !current_donor.admin
  end
end
