class DashboardController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  
  def index
    @investments = Investment.where(customer_id: current_user.id).order("created_at DESC")
  end
end
