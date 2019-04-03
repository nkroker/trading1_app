require 'open-uri'
@companies = JSON.parse(open("https://api.iextrading.com/1.0/ref-data/symbols").read)

@companies.each do |company|
	Company.create(name: company["name"], symbol: company["symbol"], company_type: company["type"])
end

@admin = User.create(email: 'nikhilq.75@gmail.com', password: 'Admin@12345', contact_no: '9165010644')
@admin.add_role :admin
