class Company < ApplicationRecord
  resourcify
	validates_uniqueness_of   :symbol
end
