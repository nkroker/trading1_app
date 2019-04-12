class InvitationMailer < ApplicationMailer

  def confirmation_instructions(user)
    mail(to: user.email, subject: 'Invitation Email from Traing1', template_path: '/users/mailer/')
  end

end
