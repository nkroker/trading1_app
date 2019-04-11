class DashboardController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource 
  
  def index
    @investments = Investment.where(customer_id: current_user.id).order("created_at DESC")
  end
end
