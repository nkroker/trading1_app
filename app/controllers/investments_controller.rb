class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_investment, only: [:show, :edit, :update, :destroy]

  def index
    @investmentents = Investment.all
  end

  def new
    @investment = Investment.new
    # byebug
  end

  def create
    # current_user.stripe_customer_id.blank?
    #Stripe::Charge.create(amount: params[:amount])
    @investment = Investment.new(investment_params)
    @investment.customer_id = current_user.id

    respond_to do |format|
      if @investment.save
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render "dashboard/index", status: :created, location: @investment }
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
