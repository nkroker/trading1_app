class AdminController < ApplicationController
  # load_and_authorize_resource
  def index
    @investments = Investment.where(customer_id: current_user.users.pluck(:id))
  end
end
