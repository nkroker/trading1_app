class ApplicationMailer < ActionMailer::Base
  default from: ENV['DEVISE_MAIL']
  layout 'mailer'
end
