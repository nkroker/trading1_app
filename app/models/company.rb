class Company < ApplicationRecord
	validates_uniqueness_of   :symbol
end
