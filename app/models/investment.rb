class Investment < ApplicationRecord
  belongs_to :coustomer, class_name: "User"
end
