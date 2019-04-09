class AdminController < ApplicationController
  before_action :check_user_role!

  def check_user_role!
    unless current_user.is_admin?
      redirect_to root_path,flash: { :error => "Insufficient rights!" }
    end
  end

  def index
    @investments = Investment.all
  end
end
