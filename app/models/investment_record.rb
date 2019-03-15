class InvestmentRecord < ApplicationRecord
  belongs_to :admin, class_name: "User"
  belongs_to :investment
end
