class AdminCompany < ApplicationRecord
  belongs_to :admin, class_name: "User"
end
