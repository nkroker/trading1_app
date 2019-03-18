class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :aadhar_no, :pan_no, :email, :password, :password_confirmation, :remember_me, :image, :contact_no]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    # devise_parameter_sanitizer.for(:User).concat [:image]
  end
end
