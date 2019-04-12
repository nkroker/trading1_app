class ChargesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token  

  before_filter(:only => [:new, :create]) { unauthorized! if cannot? :read, :charges }

  def new
  end

  def create
    if current_user.create_stripe_customer(params[:stripeToken])
      redirect_to(new_investment_path)
    else
      flash[:alert] = current_user.errors.messages
    end
  end
end
