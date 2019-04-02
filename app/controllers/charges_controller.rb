class ChargesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token  

  def new
  end

  def create
    Stripe.api_key = ENV['SECRET_KEY']
    if current_user.create_stripe_customer(params[:stripeToken])
      redirect_to(root_path)
    else
      flash[:alert] = current_user.errors .messages
    end
  end
end
