class AdminController < ApplicationController
  before_action :check_user_role!

  def check_user_admin!
    unless current_user.is_role?
      redirect_to root_path, error: "you are not authorized"
    end
  end

  def index
    @investments = Investment.all
  end
end
