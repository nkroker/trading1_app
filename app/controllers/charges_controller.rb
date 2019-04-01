class ChargesController < ApplicationController
  before_action :authenticate_user!
  # include Devise::Controllers::Helpers
  skip_before_action :verify_authenticity_token  
  #protect_from_forgery
  # Stripe.api_key = "sk_test_hMWYftqrT34GjDz1Jm5B8cbt004O9VxlOA"
  # STRIPE_SECRET_KEY=sk_test_hMWYftqrT34GjDz1Jm5B8cbt004O9VxlOA

  def new
  end

  def create
    token = params[:stripeToken]
    customer = Stripe::Customer.create({
        source: token,
        email: current_user.email
    })

    current_user.update_attribute(:stripe_customer, customer.id)
    redirect_to(root_path)
  end
end
