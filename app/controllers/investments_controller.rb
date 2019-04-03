class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @investments = Investment.all
  end

  def new
    if current_user.stripe_customer?
      @investment = Investment.new
    else
      redirect_to(new_charge_path)
    end
  end

  def create
    @investment = Investment.new(investment_params)

    charge = Stripe::Charge.create({
        customer: current_user.stripe_customer,
        amount: (@investment.amount*100).to_i,
        description: @investment.description,
        currency: 'inr',
      })
    @investment.charge_token = charge.id
    @investment.customer_id = current_user.id

    respond_to do |format|
      if @investment.save

        format.html { redirect_to root_path }
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_investment
      @investment = Investment.find(params[:id])
    end

    def investment_params
      params.require(:investment).permit(:amount, :description)
    end
end
