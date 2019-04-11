class InvitationsController < Devise::InvitationsController

  before_action :update_sanitized_params, only: :update

  def update
    super
  end

  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :pan_no, :aadhar_no, :contact_no, :password, :image])
  end
end
