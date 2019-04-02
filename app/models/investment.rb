class Investment < ApplicationRecord
  belongs_to :customer, :class_name => "User"

  validates :amount, presence: true
  validates :description, presence: true
end
