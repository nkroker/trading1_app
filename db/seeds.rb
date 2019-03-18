# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
@companies = JSON.parse(open("https://api.iextrading.com/1.0/ref-data/symbols").read)

@companies.each do |company|
	Company.create(name: company["name"], symbol: company["symbol"], company_type: company["type"])
end
