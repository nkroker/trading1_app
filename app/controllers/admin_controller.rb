class AdminController < ApplicationController
  include CanCan::ControllerAdditions
  before_action(:only => :index) { unauthorized! if cannot? :read, :admin }
  def index
    @investments = Investment.where(customer_id: current_user.users.pluck(:id))
  end
end
