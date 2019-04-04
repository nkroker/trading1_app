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
    charge = @investment.create_charge(current_user.stripe_customer)
    if charge.is_a?(String)
      render :new
    else
      @investment.charge_token = charge.id if charge.present?
      @investment.customer_id = current_user.id
      @investment.save
      redirect_to root_path
    end
  end

  private
    # def set_investment
    #   @investment = Investment.find(params[:id])
    # end

    def investment_params
      params.require(:investment).permit(:amount, :description)
    end
end

