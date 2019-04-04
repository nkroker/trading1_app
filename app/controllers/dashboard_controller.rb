class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @investments = Investment.where(customer_id: current_user.id)
  end
end
