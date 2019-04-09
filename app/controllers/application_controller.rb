class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(user)
    (user.has_role? :admin) ? admin_index_path : root_path
  end

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :aadhar_no, :pan_no, :email, :password, :remember_me, :image, :contact_no]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
