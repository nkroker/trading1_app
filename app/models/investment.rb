class Investment < ApplicationRecord
  belongs_to :customer, :class_name => "User"

  validates_presence_of :amount, :description
end
