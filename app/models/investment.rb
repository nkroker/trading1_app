class Investment < ApplicationRecord

  attr_accessor :problems # This attr_accessor is used for creating a virtual attribute

  belongs_to :customer, :class_name => "User"

  validates_presence_of :amount, :description, :charge_token


  # method for creating the charge
  def create_charge (investment, current_user)
    begin
      charge = Stripe::Charge.create({
          customer: current_user.stripe_customer,
          amount: (investment.amount*100).to_i,
          description: investment.description,
          currency: 'inr',
        })
    rescue Stripe::InvalidRequestError => e
      self.problems = e.message  # Here we are setting the data into virtual attribute
    end

    investment.charge_token = charge.id if charge.present?
    investment.customer_id = current_user.id
    investment
  end

end
