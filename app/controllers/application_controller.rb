class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # error handling logic for a user if he try to perform an action which he is not authorized
  rescue_from CanCan::AccessDenied do |exception|
    flash[:authorization_error] = "Not authorized to perform that action ❌"
    redirect_to listings_path
  end

  protected

  # this will allow user to add all the following fields while signing up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :bio, :profile_pic, :email, address_attributes: [:street, :suburb, :city, :state, :country]])
    # this will allow current user to edit all the following attributes
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:first_name, :last_name, :bio, :profile_pic, :email, :password, :password_confirmation, :current_password, address_attributes: [:street, :suburb, :city, :state, :country])
    end
  end
end
