class AdminController < ApplicationController
  # load_and_authorize_resource
  def index
    @investments = Investment.where(customer_id: (User.where(invited_by: current_user.id).first.id)).first
  end
end
