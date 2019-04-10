class AdminController < ApplicationController
  # load_and_authorize_resource
  def index
    @investments = Investment.all
  end
end
