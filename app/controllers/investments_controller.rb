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
    @investment = @investment.create_charge(@investment, current_user)
    if !@investment.problems.blank?
      flash[:error] = @investment.problems  # Here we are fetching information from virtual attribute
    end

    respond_to do |format|
      @investment.save ? format.html { redirect_to root_path } : format.html { render :new }
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
