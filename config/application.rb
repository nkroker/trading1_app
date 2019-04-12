require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trading1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.stripe.publishable_key = 'pk_test_vxqMTEKZXLRroPCZy79EL7fF00pGCxxEjK'
    config.stripe.secret_key = 'sk_test_hMWYftqrT34GjDz1Jm5B8cbt004O9VxlOA'

    ENV['DEVISE_MAIL'] = 'trajaesting@gmail.com'
    ENV['DEVISE_MAIL_PASSWORD'] = '1597532684'
    ENV['DEVISE_MAIL_DOMAIN'] = 'localhost:3000'
  end
end
