class Investment < ApplicationRecord
  resourcify

  attr_accessor :problems # This attr_accessor is used for creating a virtual attribute

  validates_presence_of :amount, :description, :charge_token

  belongs_to :customer, :class_name => "User"

  # method for creating the charge
  def create_charge(stripe_customer)
    begin
      str = Stripe::Charge.create({
          customer: stripe_customer,
          amount: (amount*100).to_i,
          description: description,
          currency: 'inr',
      })
    rescue Stripe::InvalidRequestError => e
      self.errors.add(:base,e.message)
      e.message
    end
  end

end
