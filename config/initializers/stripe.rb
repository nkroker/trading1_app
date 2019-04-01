# Rails.configuration.stripe = {
#   :publishable_key => ENV['PUBLISHABLE_KEY'],
#   :secret_key      => ENV['SECRET_KEY']
# }


# # Stripe.api_key = Rails.configuration.stripe[:secret_key]




# Stripe::Token.create({
#   card: {
#     number: '4242424242424242',
#     exp_month: 4,
#     exp_year: 2020,
#     cvc: '314',
#   },
# })