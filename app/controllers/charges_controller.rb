class ChargesController < ApplicationController
  Stripe.api_key = "sk_test_hMWYftqrT34GjDz1Jm5B8cbt004O9VxlOA"

  def new
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create({
        source: token,
        email: current_user.email,
    })


    current_user.stripe_customer = customer.id
    current_user.save
    redirect_to(root_path)
  end
end
