class EmailMailer < ActionMailer::Base
  default from: "alessandro@alessandrostein.com"

  layout 'application'

  def welcome_email(email)
    @email = email
    @url = 'www.alessandrostein.com'
    mail(to: @email.to, subject: @email.subject)
  end

  def protect_against_forgery?
      false
  end

end
