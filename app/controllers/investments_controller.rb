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
    flash[:error] = @investment.problems if !@investment.problems.blank?  # Here we are fetching information from virtual attribute in this Guard condition

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
